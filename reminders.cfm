<cfinclude template="/include/head.cfm"/>

<body>

<div class="container">
<cfinclude template="/include/navbar.cfm"/>

<cfif structKeyExists(url, "noteID") and Len( url.noteID )>
    <cfoutput>
        <cfquery name="qryResult">
            SELECT note
            FROM notes
            WHERE id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#url.noteID#" />
        </cfquery>
        <cfquery name="reminders">
            SELECT  *
            FROM    reminders
            WHERE   note_id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#url.noteID#" />
        </cfquery>
        <div class="jumbotron">
            <h1>Reminders</h1>
            <p class="lead">#qryResult.note#</p>
            <cfif #reminders.recordcount# EQ 0>
                No reminders found for this note.
            <cfelse>
                <cfloop query="reminders">
                        <h5 id="reminder_#reminder_id#">Reminder set for:</h5>
                    #DateTimeFormat( #sendtime# )# <i #sent EQ 'FALSE' ? ' class="fa fa-clock-o fa-lg"' : ' class="fa fa-check-circle fa-lg"'#></i><br>
                    <cfif #sent# EQ TRUE>
                        Message sent:<br>#sentnote#<br>
                    </cfif>
                    <br>
                    <form action="/process/delete_reminder.cfm" method="post">
                        <input type="Submit" value="Delete Reminder">
                        <input type="hidden" name="reminder_id" value="#reminder_id#"/>
                        <input type="hidden" name="note_id" value="#note_id#"/>
                    </form>
                    <hr>
                </cfloop>
            </cfif>
            <h4>Create new reminder:</h4>
            <form action="/process/submit_reminder.cfm" method="post">
                <input type="date" name="date" required/>
                <input type="time" name="time" required/>
                <input type="hidden" name="note_id" value="#noteID#"/>
                <input type="submit" value="Set Reminder"/>
            </form>
            <hr>
            <a class="btn btn-primary" href="/index.cfm">Back to notes</a>
        </div>
    </cfoutput>
<cfelse>
        <div class="jumbotron">
            <h1>ERROR</h1>
            <p class="lead">No note selected.</p>
            <a href="index.cfm">Go back</a>
        </div>
</cfif>

<cfinclude template="/include/footer.cfm"/>

</div><!-- /container -->
</body>
</html>
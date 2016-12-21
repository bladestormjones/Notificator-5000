<cfinclude template="/include/head.cfm"/>

<body>

<div class="container">
<cfinclude template="/include/navbar.cfm"/>

    <cfif structKeyExists(Form, "editID") and Len( form.editID )>
        <cfoutput>
            <cfquery name="qryResult">
                SELECT note
                FROM notes
                WHERE id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#editID#" />
            </cfquery>
        </cfoutput>

        <div class="jumbotron">
            <h1>Edit Note</h1>
            <p class="lead">Edit your note below:</p>
            <cfoutput query="qryResult">
            <form action="process/edit_note.cfm" method="post">
                Note:<br>
                <textarea name="note" rows="4" cols="50" maxlength="144"><cfoutput>#qryResult.note#</cfoutput></textarea>
                <input type="hidden" name="editID" value="#editID#"/>
                <br><br>
                <input type="submit" value="Edit Note">
            </form>
            </cfoutput>
        </div>
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
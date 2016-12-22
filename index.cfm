<cfquery name="myQuery">
    SELECT  *
    FROM    notes
    WHERE   author = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.user_id#" />
</cfquery>

<cfinclude template="/include/head.cfm"/>

<body>

<div class="container">
    <cfinclude template="/include/navbar.cfm"/>

    <div class="jumbotron">
        <h1>Notificator 5000</h1>
        <p class="lead"><cfoutput>Welcome, #Getauthuser()#!</cfoutput></p>
        <form action="process/submit_note.cfm" method="post">
            Note:<br>
            <textarea name="note" rows="4" cols="50" minlength="10" maxlength="144">Something profound</textarea>
            <br>
            <input type="submit" value="Make Note">
        </form>
    </div>

    <div class="row marketing">
        <div class="col-lg-6">

            <cfoutput query="myQuery" group="id">
                <cfif myQuery.currentrow % 2 eq 1>
                    <cfinclude template="/include/notearea.cfm">
                </cfif>
            </cfoutput>

        </div>
        <div class="col-lg-6">

            <cfoutput query="myQuery" group="id">
                <cfif myQuery.currentrow % 2 eq 0>
                    <cfinclude template="/include/notearea.cfm">
                </cfif>
            </cfoutput>

        </div>
    </div>

    <cfinclude template="/include/footer.cfm"/>

</div> <!-- /container -->

</body>
</html>
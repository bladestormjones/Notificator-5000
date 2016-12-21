<cfinclude template="head.cfm"/>

<body>

<div class="container">
<cfinclude template="navbar.cfm"/>

<cfif usernote eq "yes">
    <cfoutput>
        <cfquery name="qryResult">
            SELECT note FROM user_#getAuthUser()#
            WHERE id = #editID#
        </cfquery>
    </cfoutput>
    <cfelse>
    <cfquery name="qryResult">
    SELECT note FROM notes
    WHERE id = #editID#
    </cfquery>
</cfif>

    <div class="jumbotron">
        <h1>Edit Note</h1>
        <p class="lead">Edit your note below:</p>
        <cfoutput query="qryResult">
        <form action="edit_note.cfm" method="post">
            Note:<br>
            <textarea name="note" rows="4" cols="50" maxlength="144"><cfoutput>#qryResult.note#</cfoutput></textarea>
            <input type="hidden" name="id" value="#editID#"/>
            <input type="hidden" name="usernote" value="#usernote#"/>
            <br><br>
            <input type="submit" value="Edit Note">
        </form>
        </cfoutput>
    </div>
    <div class="col-lg-6">

    </div>

    <cfinclude template="footer.cfm"/>

    </div><!-- /container -->
    </body>
</html>
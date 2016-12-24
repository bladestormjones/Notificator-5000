<cfif !structKeyExists(Form, "sortmethod") and !structKeyExists(Session, "sortmethod")>
    <cfset session.sortmethod = "id">
<cfelseif !structKeyExists(Form, "sortmethod") AND structKeyExists(Session, "sortmethod")>
<cfelseif #form.sortmethod# EQ "id">
    <cfset session.sortmethod = "id">
<cfelseif #form.sortmethod# EQ "done">
    <cfset session.sortmethod = "done">
</cfif>

<cfset obj = new components.sort() />
<cfset myQuery = obj.sortmethod( session.sortmethod ) />

<cfinclude template="/include/head.cfm"/>

<body>

<div class="container">
    <cfinclude template="/include/navbar.cfm"/>

    <div class="jumbotron">
        <H1><cfoutput>Welcome, #getAuthUser()#!</cfoutput></H1>
        <form action="process/submit_note.cfm" method="post">
            Enter note:<br>
            <textarea name="note" rows="4" cols="50" minlength="10" maxlength="144"></textarea>
            <br>
            <input type="submit" value="Make Note">
        </form>
    </div>

    <div class="row marketing">
        <cfoutput>
            <cfif #myQuery.recordcount# EQ 0>
                    <h4>No notes found.</h4>
            <cfelse>
                <div align="right">
                    Sort by:&nbsp;
                    <div style="float:right">
                        <form action="/index.cfm" method="post">
                            <input type="hidden" name="sortmethod" value="id">
                            <button type="submit" title="ID" class="btn btn-primary">
                                <i class="fa fa-hashtag fa-lg"></i>
                            </button>
                        </form>
                    </div>
                    <div style="float:right">
                        |
                    </div>
                    <div style="float:right">
                        <form action="/index.cfm" method="post">
                            <input type="hidden" name="sortmethod" value="done">
                            <button type="submit" title="Done" class="btn btn-primary">
                                <i class="fa fa-check fa-lg"></i>
                            </button>
                        </form>
                    </div>
                </div>
                    <cfinclude template="/include/notearea.cfm">
            </cfif>
        </cfoutput>
    </div>

    <cfinclude template="/include/footer.cfm"/>

</div> <!-- /container -->

</body>
</html>
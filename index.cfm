<cfquery name="myQuery">
    SELECT * FROM notes
</cfquery>

<cfinclude template="head.cfm"/>

<body>

<div class="container">
    <cfinclude template="navbar.cfm"/>

    <div class="jumbotron">
        <h1>Notificator 5000</h1>
        <cfif Getauthuser() NEQ "">
            <p class="lead"><cfoutput>Welcome, #Getauthuser()#! Your personal notes are displayed below. General notes are beneath that.</cfoutput></p>
            <form action="submit_note.cfm" method="post">
                Note:<br>
                <textarea name="note" rows="4" cols="50" maxlength="144">Something profound</textarea>
                <br>
                <cfoutput>
                <input type="hidden" name="author" value="#Getauthuser()#">
                </cfoutput>
                <br>
                <input type="submit" value="Submit">
            </form>
        <cfelse>
                <p class="lead">Make a note here, then read it in the list below once you are done!</p>
                <form action="submit_note.cfm" method="post">
                    Note:<br>
                    <textarea name="note" rows="4" cols="50" maxlength="144">Something profound</textarea>
                    <br>
                    Author:<br>
                    <input type="text" name="author" maxlength="25" value="Anon">
                    <br><br>
                    <input type="submit" value="Submit">
                </form>
        </cfif>
    </div>

    <cfif getAuthUser() NEQ "">
        <cfoutput>
        <cfquery name="myQuery2">
            SELECT * FROM user_#getAuthUser()#
        </cfquery>
        </cfoutput>
        <h3>Personal Notes</h3>
    <div class="row marketing">
        <div class="col-lg-6">

            <cfoutput query="myQuery2" group="id">
                <cfif myQuery2.currentrow % 2 eq 1>
                    <cfinclude template="noteareauser.cfm">
                </cfif>
            </cfoutput>

        </div>
        <div class="col-lg-6">

            <cfoutput query="myQuery2" group="id">
                <cfif myQuery2.currentrow % 2 eq 0>
                    <cfinclude template="noteareauser.cfm">
                </cfif>
            </cfoutput>

        </div>
    </div>

        <hr>
        <h3>General Notes</h3>
    </cfif>

    <div class="row marketing">
        <div class="col-lg-6">

            <cfoutput query="myQuery" group="id">
                <cfif myQuery.currentrow % 2 eq 1>
                    <cfinclude template="notearea.cfm">
                </cfif>
            </cfoutput>

        </div>
        <div class="col-lg-6">

            <cfoutput query="myQuery" group="id">
                <cfif myQuery.currentrow % 2 eq 0>
                    <cfinclude template="notearea.cfm">
                </cfif>
            </cfoutput>

        </div>
    </div>

    <cfinclude template="footer.cfm"/>

</div> <!-- /container -->

</body>
</html>
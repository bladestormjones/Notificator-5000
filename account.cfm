<cfinclude template="/include/head.cfm"/>

<body>

<div class="container">

<cfinclude template="/include/navbar.cfm"/>

    <div class="jumbotron">

        <cfquery name="userinfo">
            SELECT username,email,password
            FROM users
            WHERE id = "#session.user_id#"
        </cfquery>
        <cfoutput>
            <h4>User Info:</h4>
            Username: #userinfo.username#<br>
            Email: #userinfo.email#<br>
            <br>
            <form action="/process/delete_user.cfm" method="post">
                <button type="submit" class="btn btn-danger">
                    <i class="fa fa-times fa-lg"></i> Delete Account
                </button><br>
                <br>
                WARNING:<br>
                This action is irreversible and will also delete all your notes!<br>
                Are you sure you wish to proceed?<br>
                <br>
                <input type="checkbox" name="confirm" required value="true" /> Confirm account deletion
            </form>
        </cfoutput>

    </div>

<cfinclude template="/include/footer.cfm"/>

</div> <!-- /container -->

</body>
</html>
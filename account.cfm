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
            <h4>User Info for #userinfo.username#:</h4>
            <form action="/process/edit_user.cfm" method="post"/>
                Email:<br>
                <input type="text" name="newEmail" value="#userinfo.email#"/><br>
                Change Password:<br>
                <input type="password" name="newPassword" placeholder="Enter New Password"><br>
                <br>
                Confirm old password to make changes:<br>
                <input type="password" name="oldPassword" placeholder="Enter Old Password" required><br>
                <br>
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-pencil-square-o fa-lg"></i> Make Changes
                </button>
            </form>
            <hr>
            <h4>Account Deletion:</h4>
            WARNING:<br>
            This action is irreversible and will also delete all your notes!<br>
            Are you sure you wish to proceed?<br>
            <br>
            <form action="/process/delete_user.cfm" method="post">
            <input type="checkbox" name="confirm" required value="true" /> Confirm account deletion<br>
            <br>
                <button type="submit" class="btn btn-danger">
                    <i class="fa fa-times fa-lg"></i> Delete Account
                </button>
            </form>
        </cfoutput>

    </div>

<cfinclude template="/include/footer.cfm"/>

</div> <!-- /container -->

</body>
</html>
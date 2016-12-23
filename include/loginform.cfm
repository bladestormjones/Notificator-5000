<cfinclude template="/include/head.cfm"/>

<cfoutput>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4" align="center">
                <h1 class="text-center login-title">Sign in to continue to the Notificator 5000</h1>
                <div class="account-wall">
                    <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                         alt="">
                    <form class="form-signin" method="post" action="#CGI.script_name#?#CGI.query_string#">
                        <input type="text" name="j_username" class="form-control" placeholder="Username" maxlength="25" required autofocus>
                        <input type="password" name="j_password" class="form-control" placeholder="Password" maxlength="60" required>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                            Sign in</button>
                    </form>
                </div>
                <br>
                No account yet?<br>
                <a href="/signupform.cfm">Sign up here.</a>
            </div>
        </div>
    </div>
</cfoutput>
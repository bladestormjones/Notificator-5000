<cfinclude template="/include/head.cfm"/>

<cfoutput>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
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
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">Or create a new user account</h1>
                <div class="account-wall">
                    <form class="form-signin" method="post" action="/process/create_user.cfm">
                        <input type="text" name="username" class="form-control" placeholder="Username" required>
                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                        <input type="password" name="password" class="form-control" placeholder="Password" minlength="8" required>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                            Create Account
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
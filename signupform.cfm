<cfinclude template="/include/head.cfm"/>

<cfoutput>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4" align="center">
                <h1 class="text-center login-title">Create new user account</h1>
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
                <br>
                <a href="/index.cfm">Return to login.</a>
            </div>
        </div>
    </div>
</cfoutput>
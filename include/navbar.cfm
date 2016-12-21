<div class="header clearfix">
    <nav>
        <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="index.cfm">Home</a></li>
            <li role="presentation"><a href="moscow.cfm">About</a></li>
            <cfif getAuthUser() EQ "">
                <li role="presentation"><a href="signup.cfm">Create Account</a></li>
                <cfelse>
                <li role="presentation"><a href="account.cfm">Edit Account</a></li>
            </cfif>
        </ul>
    </nav>
    <h3 class="text-muted">Notify</h3>
</div>
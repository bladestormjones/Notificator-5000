<cfoutput>
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation"#cgi.script_name EQ '/index.cfm' ? ' class="active"' : ''#>
                    <a href="index.cfm">
                        Home
                    </a>
                </li>
                <li role="presentation"#cgi.script_name EQ '/moscow.cfm' ? ' class="active"' : ''#>
                    <a href="moscow.cfm">
                        About
                    </a>
                </li>
                <li role="presentation"#cgi.script_name EQ '/account.cfm' ? ' class="active"' : ''#>
                    <a href="account.cfm">
                        Edit Account
                    </a>
                </li>
            </ul>
        </nav>
        <h3 class="text-muted">Notificator 5000</h3>
    </div>
</cfoutput>
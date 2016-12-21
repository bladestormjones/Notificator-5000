<cfcomponent>

    <cfset this.name = "Notify">
    <cfset this.sessionmanagement = "True">
    <cfset this.defaultdatasource = "notes">
    <link rel="icon" href="favicon.ico">

    <cffunction name="OnRequestStart">
    <cfargument name = "request" required="true"/>
    <cfif IsDefined("Form.logout")>
        <cflogout>
    </cfif>

        <div align="right">
        <cflogin>
            <cfif NOT IsDefined("cflogin")>
                <cfinclude template="include/loginform.cfm">
            <cfelse>
                <cfquery name="loginQuery">
                SELECT username, Roles
                FROM users
                WHERE
                    username = '#cflogin.name#'
                    AND Password = '#cflogin.password#'
                </cfquery>
                    <cfif loginQuery.Roles NEQ "">
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#"
                                roles="#loginQuery.Roles#">
                    <cfelse>
                        <cfoutput>
                            <H2>Your login information is not valid.<br>
                                Please Try again</H2>
                        </cfoutput>
                        <cfinclude template="include/loginform.cfm">
                    </cfif>
            </cfif>
        </cflogin>
        </div>
        <div align="right">
        <cfif GetAuthUser() NEQ "">
            <cfoutput>
                <form action="index.cfm" method="Post">
                    <input type="submit" Name="Logout" value="Logout">
                </form>
            </cfoutput>
        </cfif>
        </div>
    </cffunction>
</cfcomponent>
<cfcomponent>

    <cfset this.name = "Notify">
    <cfset this.sessionmanagement = True>
    <cfset this.defaultdatasource = "notes">


    <cffunction name="OnRequestStart">
    <cfargument name = "request" required="true"/>
    <cfif structKeyExists(form, "logout")>
        <!---<cfset structdelete(session.user_id)--->
        <cflogout>
    </cfif>

        <div align="right">
        <cflogin>
            <cfif !isUserLoggedIn() AND !IsDefined("cflogin")>
                <cfinclude template="/include/loginform.cfm">
                <cfabort>
            <cfelse>
                <cfquery name="loginQuery">
                SELECT username, id
                FROM users
                WHERE
                    username = '#cflogin.name#'
                    AND Password = '#cflogin.password#'
                </cfquery>
                    <cfif loginQuery.recordcount NEQ 0>
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" roles="user">
                        <cfset session.user_id = loginQuery.id/>
                    <cfelse>
                        <cfoutput>
                            <H2>Your login information is not valid.<br>
                                Please Try again</H2>
                        </cfoutput>
                        <cfinclude template="/include/loginform.cfm">
                    </cfif>
            </cfif>
        </cflogin>
        </div>
        <div align="right">
            <cfoutput>
                <form action="index.cfm" method="Post">
                    <input type="submit" Name="Logout" value="Logout">
                </form>
            </cfoutput>
        </div>
    </cffunction>
</cfcomponent>
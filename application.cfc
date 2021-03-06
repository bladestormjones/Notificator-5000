<cfcomponent>

    <cfset this.name = "Notify">
    <cfset this.sessionmanagement = True>
    <cfset this.defaultdatasource = "notes">
	<cfset this.javaSettings.loadPaths = [ '.\jars' ]/>

    <cffunction name="OnRequestStart">
    <cfargument name = "request" required="true"/>
    <cfif structKeyExists(form, "logout")>
        <cfset clear = structdelete(session, "user_id")/>
        <cflogout>
    </cfif>

        <div align="center">
        <cflogin>
            <cfif #cgi.script_name# EQ "/process/create_user.cfm" or #cgi.script_name# EQ "/signupform.cfm" or #cgi.script_name# EQ "/process/mail_reminder.cfm">
                <!--- Do Nothing. --->
            <cfelseif !isUserLoggedIn() AND !IsDefined("cflogin")>
                <cfinclude template="/include/loginform.cfm">
                <cfabort>
            <cfelse>
                <cfquery name="loginQuery">
                SELECT username, email, id
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
                        <cfabort>
                    </cfif>
            </cfif>
        </cflogin>
        </div>
        <cfif #cgi.script_name# NEQ "/process/create_user.cfm" AND #cgi.script_name# NEQ "/signupform.cfm">
            <div style="float:right" align="right">
            <cfoutput>
                    <form action="index.cfm" method="Post">
                        <input type="hidden" name="Logout" value="Logout"/>
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-sign-out fa-lg"></i> Log Out
                        </button>
                    </form>
            </cfoutput>
            </div>
        </cfif>
    </cffunction>

    <cffunction name="OnSessionEnd">
        <cflogout>
    </cffunction>

    <cffunction name="OnApplicationEnd">
        <cflogout>
    </cffunction>

</cfcomponent>
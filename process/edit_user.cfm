<!--- This is still the "It's not pretty, but it works." version. It needs cleaning up. --->

<cfif !structKeyExists(Form, "oldPassword") or !len( form.oldPassword )>
    Please confirm current password.<br>
    <a href="/account.cfm">Go back</a>
    <cfabort>
<cfelseif !structKeyExists(Form, "newEmail") or !len( form.newEmail )>
    No email entered.<br>
    <a href="/account.cfm">Go back</a>
    <cfabort>
</cfif>

<cfquery name="check">
    SELECT  password,email
    FROM    users
    WHERE   id = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.user_id#" />
</cfquery>

<cfif #check.password# NEQ #form.oldPassword#>
    Incorrect password.<br>
    <a href="/account.cfm">Go back</a>
    <cfabort>
<cfelse>
    <cfset obj = new components.users() />
    <cfset change = ((#check.email# NEQ #form.newEmail#) ? obj.editUser( "email", #form.newEmail# ) : '' )/>
    <cfset change = ((#check.password# NEQ #form.newPassword# AND len( form.newPassword )) ? obj.editUser( "password", #form.newPassword# ) : '')>
    <cflocation url="/account.cfm" addtoken="false" />
</cfif>
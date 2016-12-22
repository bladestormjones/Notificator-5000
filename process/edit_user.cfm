<cfif !structKeyExists(Form, "oldPassword") or !len( form.oldPassword )>
    No current password confirmed.<br>
    <a href="/index.cfm">Go back</a>
    <cfabort>
</cfif>

<cfquery name="checkPW">
    SELECT  password
    FROM    users
    WHERE   id = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.user_id#" />
</cfquery>

<cfif #checkPW.password# EQ !#form.oldPassword#>
    Incorrect password.
    <a href="/index.cfm">Go back</a>
    <cfabort>
<cfelse>

</cfif>
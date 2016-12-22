<cfif structKeyExists(Form, "confirm") and Len( form.confirm ) and form.confirm EQ true>
    <cfset obj = new components.users() />
    <cfset genKey = obj.deleteUser( #session.user_id# )/>
    <cfset clear = structdelete(session, "user_id")/>
    <cflogout>
    <cflocation url = "/index.cfm" addtoken="false"/>
<cfelse>
    ... You're not meant to be here!<br>
    <a href="/index.cfm">Go back</a>
</cfif>
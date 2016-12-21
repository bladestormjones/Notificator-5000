<cfif structKeyExists(Form, "deleteID") and Len( form.deleteID )>
    <cfset obj = new components.notes() />
    <cfset genKey = obj.deleteNote( form.deleteID )/>

    <cflocation url = "/index.cfm" addtoken="false"/>
<cfelse>
    No note selected. <br/>
    <a href="/index.cfm">Go back</a>
</cfif>
<cfif structKeyExists(Form, "doneID") and Len( form.doneID )>
    <cfset obj = new components.notes() />
    <cfset genKey = obj.doneNote( form.doneID )/>

    <cflocation url = "/index.cfm##note_#doneID#" addtoken="false"/>
<cfelse>
    No note selected. <br/>
    <a href="/index.cfm">Go back</a>
</cfif>
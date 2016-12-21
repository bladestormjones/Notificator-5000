<cfif structKeyExists(Form, "editID") and Len( form.editID )>
    <cfset obj = new components.notes() />
    <cfset genKey = obj.editNote( form.note, form.editID )/>

    <cflocation url = "/index.cfm##note_#editID#" addtoken="false"/>
<cfelse>
    No note selected. <br/>
    <a href="/index.cfm">Go back</a>
</cfif>
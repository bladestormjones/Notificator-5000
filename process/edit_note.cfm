<cfif structKeyExists(Form, "note") and Len( form.note ) and structKeyExists(Form, "editID") and Len( form.editID )>
    <cfset obj = new components.notes() />
    <cfset genKey = obj.editNote( form.note, form.editID )/>

    <cflocation url = "/index.cfm##note_#editID#" addtoken="false"/>
<cfelse>
    Note not long enough. <br/>
    <a href="/index.cfm">Go back</a>
</cfif>
<cfif structKeyExists(Form, "note") and Len( form.note )>
    <cfset obj = new components.notes() />
    <cfset genKey = obj.addNote( form.note )/>

    <cflocation url = "/index.cfm##note_#genKey#" addtoken="false"/>
<cfelse>
    Deze notitie is helaas te kort <br/>
    <a href="/index.cfm">Ga terug</a>
</cfif>

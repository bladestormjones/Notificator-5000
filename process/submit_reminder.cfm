<cfif structKeyExists(Form, "note_id") AND len( form.note_id) AND structKeyExists(Form, "date") AND len( form.date ) AND structKeyExists(Form, "time") AND len( form.time ) >
    <cfset obj = new components.reminders() />
    <cfset genKey = obj.addReminder( #form.note_id#, #date#&" "&#time# )/>

    <cflocation url="/reminders.cfm?noteID=#form.note_id###reminder_#genKey#" addtoken="false"/>
<cfelse>
    No note selected, or no date/time entered.<br>
    <a href="/index.cfm">Go back</a>
</cfif>


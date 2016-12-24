<cfif structKeyExists(Form, "reminder_id") AND len(form.reminder_id)>
    <cfset obj = new components.reminders() />
    <cfset delete = obj.deleteReminder( #form.reminder_id# )/>
    <cflocation url="/reminders.cfm?noteID=#form.note_id#" addtoken="false"/>
<cfelse>
    No reminder selected.<br>
    <a href="/index.cfm">Go back</a>
</cfif>
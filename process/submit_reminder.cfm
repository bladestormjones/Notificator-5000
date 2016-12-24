<cfif structKeyExists(Form, "note_id") AND len( form.note_id) AND structKeyExists(Form, "date") AND len( form.date ) AND structKeyExists(Form, "time") AND len( form.time ) >
    <!--- <cfquery result="genKey">
    INSERT INTO reminders
    (
    note_id,author,sendtime,sent
    )
    VALUES
    (
    <cfqueryparam cfsqltype="cf_sql_integer" value="#form.note_id#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#session.user_id#" />,
        <cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.date# #form.time#" />,
        <cfqueryparam cfsqltype="cf_sql_bit" value="0" />
        )
    </cfquery> --->
    <cfset obj = new components.reminders() />
    <cfset genKey = obj.addReminder( #form.note_id#, #date#&" "&#time# )/>

    <cflocation url="/reminders.cfm?noteID=#form.note_id###reminder_#genKey#" addtoken="false"/>
<cfelse>
    No note selected, or no date/time entered.<br>
    <a href="/index.cfm">Go back</a>
</cfif>


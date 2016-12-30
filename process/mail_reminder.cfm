<cfquery name="sendReminders">
    SELECT  *
    FROM    reminders
    WHERE   sent = 0
</cfquery>

<cfloop query="sendReminders">
    <cfif #sendReminders.sendtime# LT #now()#>
        <cfquery name="noteDetails">
            SELECT  *
            FROM    notes
            WHERE   id = #sendReminders.note_id#
        </cfquery>
        <cfquery name="userDetails">
            SELECT  *
            FROM    users
            WHERE   id = #sendReminders.author#
        </cfquery>

<!---Although all this information could be stored in the reminders database, this way you can have multiple reminders for the same note, and the reminder can be modified.--->

        <cfmail from="robin@macdaniel.nl" to="#userDetails.email#" subject="Notificator 5000: Reminder">
Hello, #userDetails.username#!

This is your scheduled reminder for your note:

#noteDetails.note#
        </cfmail>
        <cfquery>
            UPDATE  reminders
            SET     sent = 1
            WHERE   reminder_id = #sendReminders.reminder_id#;

            UPDATE  reminders
            SET     sentnote = <cfqueryparam cfsqltype="cf_sql_varchar" value="#noteDetails.note#"/>
            WHERE   reminder_id = #sendReminders.reminder_id#
        </cfquery>
    </cfif>
</cfloop>

<cfset server.lastRunTime = now()>
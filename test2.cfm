<cfset note_id = 17>

<cfquery name="note_details">
    SELECT  *
    FROM    notes
    WHERE   id = #note_id#
</cfquery>

<cfquery name="reminder_details">
    INSERT INTO reminders
    (
    note_id,author,sendtime,sent
    )
    VALUES
    (
    <cfqueryparam cfsqltype="cf_sql_integer" value="#note_details.id#" />,
    <cfqueryparam cfsqltype="cf_sql_integer" value="#note_details.author#" />,
    <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
    <cfqueryparam cfsqltype="cf_sql_bit" value="0" />
    )
</cfquery>

<input type="date" name="date" required value=now()/>
<input type="time" name="time" required value="08:00"/>

<cfdump var="#server.lastRunTime#"/>
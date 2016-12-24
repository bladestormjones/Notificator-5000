<cfcomponent>

    <cffunction name="addReminder" returntype="numeric">
        <cfargument name="noteID" type="numeric" required="true"/>
        <cfargument name="datetime" type="string" required="true"/>

        <cfquery result="qryResult">
            INSERT INTO reminders
            (
            note_id,author,sendtime,sent
            )
            VALUES
            (
            <cfqueryparam cfsqltype="cf_sql_integer" value=#arguments.noteID# />,
            <cfqueryparam cfsqltype="cf_sql_integer" value=#session.user_id# />,
            <cfqueryparam cfsqltype="cf_sql_timestamp" value=#arguments.datetime# />,
            <cfqueryparam cfsqltype="cf_sql_bit" value="0" />
            )
        </cfquery>

        <cfreturn qryResult.generatedkey/>
    </cffunction>

    <cffunction name="deleteReminder">
        <cfargument name="reminder_id" type="numeric" required="true"/>

        <cfquery>
            DELETE FROM reminders
            WHERE reminder_id = <cfqueryparam cfsqltype="cf_sql_integer" value=#arguments.reminder_id# />
        </cfquery>
    </cffunction>

</cfcomponent>
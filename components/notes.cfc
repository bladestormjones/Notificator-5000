<cfcomponent>

    <cffunction name="addNote" returntype="numeric">
        <cfargument name="note" type="string" required="true"/>
        <cfargument name="author" default="#session.user_id#"/>
        <cfargument name="done" default="false"/>
        <cfargument name="timestamp" default="#now()#"/>

        <cfquery result="qryResult">
            INSERT INTO notes
            (
                note,
                author,
                done,
                timestamp
            )
            VALUES
            (
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.note#" />,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.author#" />,
                <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.done#" />,
                <cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.timestamp#" />
            )
        </cfquery>

        <cfreturn qryResult.generatedkey/>
    </cffunction>

    <cffunction name="deleteNote">
        <cfargument name="deleteID" type="numeric" required="true"/>

        <cfquery>
            DELETE FROM reminders
            WHERE note_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.deleteID#" />;

            DELETE FROM notes
            WHERE   id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.deleteID#" />
        </cfquery>
    </cffunction>

    <cffunction name="editNote">
        <cfargument name="note" type="string" required="true"/>
        <cfargument name="editID" type="numeric" required="true"/>

        <cfquery>
            UPDATE  notes
            SET     note = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.note#" />
            WHERE   id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.editID#" />
        </cfquery>
    </cffunction>

    <cffunction name="doneNote">
        <cfargument name="doneID" type="numeric" required="true"/>

        <cfquery>
            UPDATE  notes
            SET     done = !done
            WHERE   id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.doneID#" />
        </cfquery>
    </cffunction>

</cfcomponent>
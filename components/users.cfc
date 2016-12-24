<cfcomponent>

    <cffunction name="addUser">
        <cfargument name="username" type="string" required="true"/>
        <cfargument name="password" type="string" required="true"/>
        <cfargument name="email" type="string" required="true"/>

        <cfquery>
            INSERT INTO users
            (
            username,password,roles,email
            )
            VALUES
            (
            <cfqueryparam cfsqltype="cf_sql_varchar" value=#arguments.username# />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value=#arguments.password# />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="user" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" />
            )
        </cfquery>
    </cffunction>

    <cffunction name="deleteUser">
        <cfquery>
            DELETE FROM reminders
            WHERE author = <cfqueryparam cfsqltype="cf_sql_varchar" value=#session.user_id# />;

            DELETE FROM notes
            WHERE author = <cfqueryparam cfsqltype="cf_sql_varchar" value=#session.user_id# />;

            DELETE FROM users
            WHERE id = <cfqueryparam cfsqltype="cf_sql_varchar" value=#session.user_id# />
        </cfquery>
    </cffunction>

    <cffunction name="editUser">
        <cfargument name="column" type="string" required="true"/>
        <cfargument name="newValue" type="string" required="true"/>

        <cfquery>
            UPDATE  users
            SET     #arguments.column# = <cfqueryparam cfsqltype="cf_sql_varchar" value=#arguments.newValue# />
            WHERE   id = <cfqueryparam cfsqltype="cf_sql_integer" value=#session.user_ID# />
        </cfquery>

    </cffunction>

</cfcomponent>
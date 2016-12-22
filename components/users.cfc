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
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#arguments.username# />,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#arguments.password# />,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="user" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" />
            )
        </cfquery>
    </cffunction>

    <cffunction name="deleteUser">
        <cfargument name="userID" type="numeric" required="true"/>

        <cfquery>
            DELETE FROM notes
            WHERE author = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#arguments.userID# />;

            DELETE FROM users
            WHERE id = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#arguments.userID# />
        </cfquery>
    </cffunction>

</cfcomponent>
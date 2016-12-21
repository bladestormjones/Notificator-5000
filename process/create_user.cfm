<cfquery>
    CREATE TABLE user_#username# (
    id int not null primary key auto_increment,
    note char(144),
    timestamp char(26),
    done boolean);
</cfquery>
<cfquery>
    INSERT INTO users
    (
        id,username,password,roles,email
    )
    VALUES
    (
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value= />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#username# />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#password# />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="user" />,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#email#" />
    )
</cfquery>


<cfquery>
    INSERT INTO users
    (
    username,password,roles,email
    )
    VALUES
    (
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#form.username# />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#form.password# />,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="user" />,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#" />
    )
</cfquery>

<cfquery name="loginQuery">
                SELECT username, id
                FROM users
                WHERE
                    username = '#form.username#'
                    AND Password = '#form.password#'
                </cfquery>
<cfif loginQuery.recordcount NEQ 0>
    <cfloginuser name="#form.username#" Password = "#form.password#" roles="user">
    <cfset session.user_id = loginQuery.id/>
    <cflocation url="/index.cfm" addtoken="false"/>
<cfelse>
    <cfoutput>
        <H2>Your login information is not valid.<br>
            Please Try again</H2>
    </cfoutput>
    <cfinclude template="/include/loginform.cfm">
</cfif>


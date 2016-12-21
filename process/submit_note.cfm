<cfset time = now()/>

<cfif getAuthUser() NEQ "">
    <cfoutput>
    <cfquery result="qryResult">
        INSERT INTO user_#getAuthUser()#
        (
            id,note,timestamp,done
        )
        VALUES
        (
        <cfqueryparam cfsqltype="CF_SQL_INTEGER" value= />,
        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#note# />,
        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#time# />,
        <cfqueryparam cfsqltype="CF_SQL_TINYINT" value=no />
        )
    </cfquery>

        <cflocation url = "../index.cfm##usernote_#qryResult.generatedkey#" addtoken="false"/>
    </cfoutput>
    <cfelse>
    <cfquery result="qryResult">
    INSERT INTO notes
    (
        id,note,author,timestamp
    )
    VALUES
    (
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value= />,
        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#note# />,
        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#author# />,
        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#time# />
            )
    </cfquery>

    <cflocation url = "../index.cfm##note_#qryResult.generatedkey#" addtoken="false"/>
</cfif>
<cfif structKeyExists(Form, "username") and Len( form.username ) and structKeyExists(Form, "password") and Len( form.password ) and structKeyExists(Form, "email") and Len( form.email )>
    <cfquery name="usrname">
        SELECT id
        FROM users
        WHERE username = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value=#form.username# />
    </cfquery>
<cfelse>
    Incomplete information.<br>
    <a href="/index.cfm">Go back</a>
    <cfabort>
</cfif>

<cfif usrname.recordcount NEQ 0>
    That username is already in use.<br>
    <a href="/index.cfm">Go back</a>
    <cfabort>
<cfelse>
    <cfset obj = new components.users() />
    <cfset genKey = obj.addUser( form.username, form.password, form.email )/>

    <cfquery name="loginQuery">
        SELECT  username, id
        FROM    users
        WHERE
        username = '#form.username#'
        AND Password = '#form.password#'
    </cfquery>
    <cfif loginQuery.recordcount NEQ 0>
        <cflogin>
            <cfloginuser name="#form.username#" Password = "#form.password#" roles="user">
        </cflogin>
        <cfset session.user_id = loginQuery.id/>
        <cfset session.username = loginquery.username/>
        <cfset session.email = loginQuery.email/>
        <cflocation url="/index.cfm" addtoken="false"/>
    <cfelse>
        <cfoutput>
            <H2>Your login information is not valid.<br>
                Please Try again</H2>
        </cfoutput>
        <cfinclude template="/include/loginform.cfm">
    </cfif>
</cfif>




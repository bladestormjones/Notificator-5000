<cfif usernote eq "yes">
    <cfoutput>
        <cfset table = "user_#getAuthUser()#"/>
    </cfoutput>
<cfelse>
    <cfset table = "notes"/>
</cfif>

<cfquery>
    UPDATE #table#
    SET note='#note#'
    WHERE id='#id#'
</cfquery>

<cfif usernote eq "yes">
    <cflocation url = "index.cfm##usernote_#id#" addtoken="false"/>
    <cfelse>
    <cflocation url = "index.cfm##note_#id#" addtoken="false"/>
</cfif>
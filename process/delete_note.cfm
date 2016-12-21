<cfif usernote eq "yes">
    <cfoutput>
        <cfquery>
        DELETE from user_#getAuthUser()#
        WHERE id = #deleteID#
        </cfquery>
    </cfoutput>
<cfelse>
    <cfquery>
            DELETE from notes
            WHERE id = #deleteID#
    </cfquery>
</cfif>

<cflocation url = "../index.cfm" addtoken="false"/>
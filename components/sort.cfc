<cfcomponent>

    <cffunction name="sortmethod" returntype="query">
        <cfargument name="sort" type="string" required="true"/>

        <cfquery name="sortQuery">
            SELECT  *
            FROM    notes
            WHERE   author = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.user_id#" />
            ORDER BY #session.sortmethod#
        </cfquery>

        <cfreturn sortQuery>
    </cffunction>

</cfcomponent>
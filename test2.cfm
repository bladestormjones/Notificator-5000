<cfset inFive = dateAdd( "n", 5, now() )>
<cfdump var="#inFive#"/>

<cfschedule action="update" task="TestTask2" startDate="#inFive#" startTime="#inFive#" url="http://notes.local:8888/test3.cfm" interval="Once" operation="HTTPRequest"/>

<cfschedule action="list"/>
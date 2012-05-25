<cfcomponent>

<cfsetting enablecfoutputonly="No" showdebugoutput="Yes">
<cfset this.name = "Quotivational">
<cfset this.applicationTimeout = createTimeSpan(2,0,0,0)>
<cfset this.clientmanagement= "yes">
<cfset this.loginstorage = "session">
<cfset this.sessionmanagement = "yes">
<cfset this.sessiontimeout = createTimeSpan(0,0,5,0)>
<cfset this.setClientCookies = "yes">
<cfset this.setDomainCookies = "no">
<cfset this.scriptProtect = "all">
<cfset this.mappings["/Quotivational"] = expandpath("/com/") >

<cffunction name="onApplicationStart" output="false"> 
</cffunction>

<cffunction name="onSessionStart" returntype="void" output="false">
	
	<!--- Creating temp virtual subdirectory for quote form file uploads --->
	<cfset session.myUploadDir = expandpath("/researchday2/com/data") & "/" & replace(createUUID(), "-", "_", "all")>
	
</cffunction>

<cffunction name="onSessionEnd" output="false" returntype="void">
	<cfargument name="SessionScope" required=True/>
	<cfargument name="ApplicationScope" required=False/>

	<!--- Delete dir --->
	<cfif directoryExists(session.myUploadDir)>
		<cfdirectory action="delete" directory="#session.myUploadDir#" recurse="yes" />
	</cfif>

</cffunction>


</cfcomponent>
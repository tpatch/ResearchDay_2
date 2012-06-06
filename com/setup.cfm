<cfparam name="yourTweet" default="Try a trending topic">
<cfparam name="yourPic" default="Search for something beautiful">
<cfparam name="url.tweets" default="">
<cfparam name="url.pic" default="">

<cfif IsDefined("url.submit")>
	<cfif Len(url.tweets) AND Len(url.pic)>
		<cfinclude template="twitter.cfm" />
	<cfelse>
		<p class="error">Please enter a search term in both fields.</p>
	</cfif>

	<cfset yourTweet = url.tweets>
	<cfset yourPic = url.pic>

	<cfset arrayInsertAt(application.pastSearches[1],1,"#url.tweets#")>
	<cfset arrayInsertAt(application.pastSearches[2],1,"#url.pic#")>
	<cfif ArrayIsDefined(application.pastSearches, 6)>
		<cfset arrayDeleteAt(application.pastSearches[1], 6)>
		<cfset arrayDeleteAt(application.pastSearches[2], 6)>
	</cfif>
</cfif>
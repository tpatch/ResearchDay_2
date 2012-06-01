<cfparam name="yourTweet" default="Try a trending topic">
<cfparam name="yourPic" default="Search for something beautiful">

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Quotivational</title>
		
		<meta name="description" content="Create a poster combining a tweet and photo based on your search terms.">
		<meta name="keywords" content="quotivational,twitter,flickr,generator,creator">
		<meta name="robots" content="index, follow">
		
		<link rel="stylesheet" href="styles/styles.css" media="all">
	</head>
	<body>
		<div id="page">
			<cfif IsDefined("form.submit")>
				<cfif Len(form.tweets) AND Len(form.pic)>
					<cfinclude template="com/twitter.cfm" />
				<cfelse>
					<p class="error">Please enter a search term in both fields.</p>
				</cfif>

				<cfset yourTweet = form.tweets>
				<cfset yourPic = form.pic>

				<cfset arrayInsertAt(application.pastSearches[1],1,"#form.tweets#")>
				<cfset arrayInsertAt(application.pastSearches[2],1,"#form.pic#")>
				<cfif len(application.pastSearches[1][6])>
					<cfset arrayDeleteAt(application.pastSearches[1], 6)>
					<cfset arrayDeleteAt(application.pastSearches[2], 6)>
				</cfif>
			</cfif>

			<div class="init">
				<h1>Quotivational</h1>
				<p>Generate your own inspirational quote poster.</p>

				<div class="form">
					<cfform name="userData" id="userData" action="#CGI.SCRIPT_NAME#">
						<ul>
							<li>
								<label for="tweets">Find a Tweet</label>
								<cfinput type="text" name="tweets" value="#yourTweet#" size="30">
							</li>
							<li>
								<label for="pic">Find a Photo</label>
								<cfinput type="text" value="#yourPic#" name="pic" size="30">
							</li>
						</ul>

						<cfinput type="submit" value="Create" name="submit" />
					</cfform>
				</div>

				<div class="recent">
					<div class="head">
						<h5>Recent</h5>
						<h6>Searches</h6>
					</div>
					<div class="recentwrap">
						<cfif ArrayLen(application.pastSearches[1]) GT 4>
							<cfoutput>
								<cfloop from="1" to="5" index="i">
									<span><a href="?tweets=#URLEncodedFormat(application.pastSearches[1][i])#&pic=#URLEncodedFormat(application.pastSearches[2][i])#">#application.pastSearches[1][i]# / #application.pastSearches[2][i]#</a></span>
								</cfloop>
							</cfoutput>
						</cfif>
					</div>
				</div>
			</div>
			<footer>
				<span class="author">Created by <a href="http://trevorpatch.com">Trevor Patch</a></span>
				<span class="github">View on <a href="https://github.com/tpatch/ResearchDay_2">Github</a></span>
			</footer>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="scripts/scripts.js"></script>
	</body>
</html>
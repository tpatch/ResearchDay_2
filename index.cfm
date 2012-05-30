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
		<cfparam name="yourTweet" default="Try a trending topic">
		<cfparam name="yourPic" default="Search for something beautiful">

		<div id="page">
			<cfif IsDefined("form.submit")>
				<cfif Len(form.tweets) AND Len(form.pic)>
					<cfinclude template="com/twitter.cfm" />
				<cfelse>
					<p class="error">Please enter a search term in both fields.</p>
				</cfif>

				<cfset yourTweet = form.tweets>
				<cfset yourPic = form.pic>
			</cfif>

			<div class="init">
				<h1>Quotivational</h1>
				<p>Generate your own inspirational quote poster.</p>

				<div class="form">
					<cfform name="userData" action="#CGI.SCRIPT_NAME#">
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
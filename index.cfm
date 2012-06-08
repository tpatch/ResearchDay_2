<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Quotivational | A web experiment by Trevor Patch</title>
		
		<meta name="description" content="Create a poster combining a tweet and photo based on your search terms.">
		<meta name="keywords" content="quotivational,twitter,flickr,generator,creator">
		<meta name="robots" content="index, follow">
		
		<link rel="stylesheet" href="styles/styles.css" media="all">
		<link rel="icon" type="image/ico" href="favicon.ico">
	</head>
	<body>
		<cfinclude template="com/setup.cfm" />
		<div id="page">
			
			<!--- Page header --->
			<div class="init">
				<h1>Quotivational</h1>
				<p>The terribly-named website that creates inspirational quote posters using a tweet and Flickr photo.</p>
				
				<!--- Our Form --->
				<div class="form">
					<cfform name="userData" id="userData" method="get">
						<ul>
							<li>
								<label for="tweets">Find a Tweet*</label>
								<cfif Len(URLDecode(url.tweets))>
									<cfinput type="text" name="tweets" value="#URLDecode(url.tweets)#" size="30">
								<cfelse>
									<cfinput type="text" name="tweets" value="#yourTweet#" size="30">
								</cfif>
							</li>
							<li>
								<label for="pic">Find a Photo*</label>
								<cfif Len(URLDecode(url.pic))>
									<cfinput type="text" name="pic" value="#URLDecode(url.pic)#" size="30">
								<cfelse>
									<cfinput type="text" name="pic" value="#yourPic#" size="30">
								</cfif>
							</li>
						</ul>

						<cfinput type="submit" value="Create" name="submit" />
					</cfform>
				</div>
				
				<!--- Recent Search Terms --->
				<div class="recent">
					<div class="head">
						<h5>Recent</h5>
						<h6>Searches</h6>
					</div>
					<div class="recentwrap">
						<cfif ArrayLen(application.pastSearches[1]) GT 5>
							<cfoutput>
								<cfloop from="1" to="5" index="i">
									<span><a href="?tweets=#URLEncodedFormat(application.pastSearches[1][i])#&pic=#URLEncodedFormat(application.pastSearches[2][i])#&submit=1">#application.pastSearches[1][i]# / #application.pastSearches[2][i]#</a></span>
								</cfloop>
							</cfoutput>
						</cfif>
					</div>
				</div>
			</div>
			
			<!--- Footer --->
			<footer>
				<span class="author">Created by <a href="http://trevorpatch.com">Trevor Patch</a></span>
				<span class="github">View on <a href="https://github.com/tpatch/ResearchDay_2">Github</a></span>
			</footer>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="scripts/scripts.js"></script>
	</body>
</html>
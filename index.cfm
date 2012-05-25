<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>API Playin'</title>
		
		<meta name="description" content="DESC">
		<meta name="keywords" content="KEYW">
		<meta name="robots" content="index, follow">
		
		<link rel="stylesheet" href="styles/styles.css" media="all">
	</head>
	<body>
		<div id="page">
			<cfif IsDefined("form.submit")>
				<cfinclude template="com/twitter.cfm" />
			</cfif>

			<div class="init">

				<div class="form">
					<cfform name="userData" action="#CGI.SCRIPT_NAME#">
						<cfinput type="text" name="tweets" value="Sucka" size="30">
						<cfinput type="text" value="tranquility" name="pic" size="30">
						<cfinput type="submit" value="Create" name="submit" />
					</cfform>
				</div>

			</div>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="scripts/scripts.js"></script>
	</body>
</html>
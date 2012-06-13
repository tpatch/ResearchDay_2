<!--- Begin Twitter call --->
<cfset search = "http://search.twitter.com/search.json?q=" & #URLEncodedFormat(url.tweets)# & "&rpp=8&lang=en" />

<cfhttp url="#search#" result="tweets"></cfhttp>

<cfif NOT directoryExists(session.myUploadDir)>
	<cfdirectory action="create" directory="#session.myUploadDir#" />
</cfif>

<cffile action="write" file="#session.myUploadDir#/data.json" output="#tweets.filecontent#" />

<cfset theJSON = deserializeJSON(fileRead("#session.myUploadDir#/data.json"), false)>
<cfset results = #theJSON.results#>
<cfset randTweet = #RandRange(1,ArrayLen(results))#>

<!--- Begin Flickr call --->
<cfhttp url="http://www.flickr.com/services/rest/" result="photo">
	<cfhttpparam type="url" name="api_key" value="f8c15e349d0a05ab4ba65f8701fb5caa"/>
	<cfhttpparam type="url" name="method" value="flickr.photos.search"/>
	<cfhttpparam type="url" name="text" value="#url.pic#"/>
	<cfhttpparam type="url" name="sort" value="interestingness-desc" />
	<cfhttpparam type="url" name="per_page" value="5"/>
	<cfhttpparam type="url" name="page" value="1"/>
	<cfhttpparam type="url" name="safe_search" value="2"/>
	<cfhttpparam type="url" name="content_type" value="1"/>
</cfhttp>

<cfif photo.responseheader.status_code IS 200>
	<cfset theXML = XMLParse(photo.filecontent)>

	<!---
	<cfdump var="#theXML#">
	<cfoutput>#theXML.rsp.photos.photo.XmlAttributes.id#</cfoutput>
	<cfabort />
	--->

	<cfset rand = #RandRange(1,5)#>
	<cfset photosrc = "http://farm" & #theXML.rsp.photos.photo[rand].XmlAttributes.farm# & ".staticflickr.com/" & #theXML.rsp.photos.photo[rand].XmlAttributes.server# & "/" & #theXML.rsp.photos.photo[rand].XmlAttributes.id# & "_" & #theXML.rsp.photos.photo[rand].XmlAttributes.secret# & ".jpg">
<cfelse>
	<cfset photosrc = "">
	<p>There was an error retrieving the photo.</p>
</cfif>

<cfoutput>
	<div class="wrapper">
	<div class="quotational">
		<div class="theart">
			<div class="quotecont">
				<p class="thetweet">&ldquo;#Replace(results[randTweet].text, Chr(10), "<br>", "all")#&rdquo;</p>
				<p class="tweeter">- #results[randTweet].from_user#</p>
				<p class="date"><a href="http://twitter.com/#results[randTweet].from_user#/status/#results[randTweet].id_str#" target="_blank">#DateFormat(ListFirst(results[randTweet].created_at, "+"), "mmm dd, yyyy")#</a></p>
			</div>
			<div class="imgwrap">	
				<img src="#photosrc#" class="mainphoto" />
				<a href="http://flickr.com/photos/#theXML.rsp.photos.photo[rand].XmlAttributes.owner#/#theXML.rsp.photos.photo[rand].XmlAttributes.id#" target="_blank"><em>Source</em></a>
			</div>
		</div>
	</div>
	</div>
</cfoutput>
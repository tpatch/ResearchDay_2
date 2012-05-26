<!--- Begin Twitter call --->
<cfset search = "http://search.twitter.com/search.json?q=" & #URLEncodedFormat(form.tweets)# & "&rpp=1" />
<cfset dir = getDirectoryFromPath(getCurrentTemplatePath()) >

<cfhttp url="#search#" result="tweets"></cfhttp>

<cfif NOT directoryExists(session.myUploadDir)>
	<cfdirectory action="create" directory="#session.myUploadDir#" />
</cfif>

<cfset fileWrite("#session.myUploadDir#/data.json", "#tweets.filecontent#") />

<cfset theJSON = deserializeJSON(fileRead("#session.myUploadDir#/data.json"), false)>
<cfset results = #theJSON.results#>

<!--- Begin Flickr call --->
<cfhttp url="http://www.flickr.com/services/rest/" result="photo">
	<cfhttpparam type="url" name="api_key" value="f8c15e349d0a05ab4ba65f8701fb5caa"/>
	<cfhttpparam type="url" name="method" value="flickr.photos.search"/>
	<cfhttpparam type="url" name="text" value="#form.pic#"/>
	<cfhttpparam type="url" name="tags" value="#form.pic#"/>
	<cfhttpparam type="url" name="sort" value="interestingness-desc" />
	<cfhttpparam type="url" name="per_page" value="10"/>
	<cfhttpparam type="url" name="page" value="1"/>
	<cfhttpparam type="url" name="safe_search" value="2"/>
</cfhttp>

<cfif photo.responseheader.status_code IS 200>
	<cfset theXML = XMLParse(photo.filecontent)>

	<!---
	<cfdump var="#theXML#">
	<cfoutput>#theXML.rsp.photos.photo.XmlAttributes.id#</cfoutput>
	<cfabort />
	--->
	
	<cfset rand = #RandRange(1,10)#>
	<cfset photosrc = "http://farm" & #theXML.rsp.photos.photo[rand].XmlAttributes.farm# & ".staticflickr.com/" & #theXML.rsp.photos.photo[rand].XmlAttributes.server# & "/" & #theXML.rsp.photos.photo[rand].XmlAttributes.id# & "_" & #theXML.rsp.photos.photo[rand].XmlAttributes.secret# & ".jpg">
<cfelse>
	<cfset photosrc = "">
	<p>There was an error retrieving the photo.</p>
</cfif>

<cfoutput>
	<div class="theart">
		<div class="quotecont">
			<p class="thetweet">"#results[1].text#"</p>
			<p class="tweeter">- #results[1].from_user#</p>
		</div>
		<img src="#photosrc#" class="mainphoto" />
	</div>
</cfoutput>
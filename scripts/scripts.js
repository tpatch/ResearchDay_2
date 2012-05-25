/*jslint devel: false, browser: false, white: true */
/*global $: false, window: false */

(function () {
	"use strict";

	window.API = {
		init: function () {
			this.imagesize();
			this.formhandler();
		},

		imagesize: function () {
			var artHeight = $(".mainphoto").height();
			console.log(artHeight);

			$("#submit").click(function(){
				if($(".mainphoto")){
					artHeight = $(".mainphoto").height();
					console.log(artHeight);

					$(".theart").css('height', artHeight);
				}
				else{
					$("#submit").trigger('click');
				}
			});
		},

		formhandler: function() {
			var tweetOrig = "Cray Cray",
				picOrig = "Beautiful Sunset",
				tweetVal = $("#tweets").val(),
				picVal = $("#pic").val();

			if(tweetOrig === tweetVal){
				$("#tweets")
					.css('color', '#acacac')
					.focus(function(){
						$(this)
							.css('color', '#0776A0')
							.val('');
					});
			};

			if(picOrig === picVal){
				$("#pic")
					.css('color', '#acacac')
					.focus(function(){
						$(this)
							.css('color', '#0776A0')
							.val('');
					});
			};

		}
	};

	$(window.document).ready(function () {
		window.API.init();
	});
}());
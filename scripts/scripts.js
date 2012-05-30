/*jslint devel: false, browser: false, white: true */
/*global $: false, window: false */

(function () {
	"use strict";

	window.API = {
		init: function () {
			this.art();
			this.formhandler();
			this.errorcheck();
		},

		art: function () {
			$(".mainphoto").load(function(){
					var artHeight = $(".mainphoto").height();

					$('.theart')
						.css('height', artHeight)
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

			$(".form input").focus(function(){
				$(".form")
					.css('background-color', 'rgba(25,69,86,.3)')
					.css('box-shadow', '2px 2px 6px #999');
			});
			$(".form input").blur(function(){
				$(".form")
					.css('background-color', 'rgba(25,69,86,.2)')
					.css('box-shadow', 'none');
			});

		},

		errorcheck: function(){
			var tweet = $("#tweets"),
				pic = $("#pic");

			$("#submit").click(function(){
				if( !tweet.val() || !pic.val() ){
					alert('Please fill in both search fields.');
					return false;
				}
			});
		}

	};

	$(window.document).ready(function () {
		window.API.init();
	});
}());
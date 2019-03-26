//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).on('turbolinks:load', () => {

$(function() {
				$("#city").autocomplete({
					source : function(request, response) {
						$.ajax({
							url : "http://api.cdek.ru/city/getListByTerm/jsonp.php?callback=?",
							dataType : "jsonp",
							data : {
								q : function() {
									return $("#city").val()
								},
								name_startsWith : function() {
									return $("#city").val()
								}
							},
							success : function(data) {
								response($.map(data.geonames, function(item) {
									return {
										label : item.name,
										value : item.name,
										id : item.id
									}
								}));
							}
						});
					},
					minLength : 1,
					select : function(event, ui) {
						console.log("Yep!");
						$('#receiverCityId').val(ui.item.id);
					}
				} );
});
});
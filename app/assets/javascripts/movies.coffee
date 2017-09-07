# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('.advanced-search').click ->
		$('.top-bar').toggleClass('search-active').done(
				$('.advsearch').toggleClass 'advsearch-active'
		)
  		

###
@Author: Kristinita
@Date:	 2017-05-02 11:44:00
@Last Modified time: 2018-03-24 08:49:55
###
####################
# gemini-scrollbar #
####################
###
Custom scrollbar instead of native body scrollbar:
https://noeldelgado.github.io/gemini-scrollbar/
https://github.com/noeldelgado/gemini-scrollbar/issues/46#issuecomment-374928170
###

# [NOTE] Required; not delete this line, scrolling will be incorrect.
internals = {}

internals.initialize = ->
	internals.scrollbar = new GeminiScrollbar(
		# querySelector method — https://www.w3schools.com/jsref/met_document_queryselector.asp
		element: document.querySelector('body')
		autoshow: true
		# Force Gemini for correct scrollbar displaying in mobile devices
		# https://github.com/noeldelgado/gemini-scrollbar#options
		forceGemini: true).create()
	internals.scrollingElement = internals.scrollbar.getViewElement()
	internals.scrollToHash()
	# JQuery Lazy support —
	# https://github.com/eisbehr-/jquery.lazy/issues/88#issuecomment-299138103
	$('.SashaLazy').Lazy
		appendScroll: $(internals.scrollbar.getViewElement())
		###
		Run method “update” of Gemini:
		https://github.com/eisbehr-/jquery.lazy/issues/88#issuecomment-299196388
		http://jquery.eisbehr.de/lazy/example_callback-functions
		https://github.com/noeldelgado/gemini-scrollbar#basic-methods
		###
		afterLoad: ->
			internals.scrollbar.update()
			return
	return

internals.handleOrientationChange = ->
	internals.scrollbar.update()
	internals.scrollToHash()
	return

internals.scrollToHash = ->
	# [INFO] Get hash — part of URL after “#” symbol:
	# https://javascript.ru/window-location
	hash = location.hash
	###
	[INFO] Decode URL hash, example:
	“#%D0%9A%D0%B8%D1%80%D0%B0” → “#Кира”
	https://www.w3schools.com/jsref/jsref_decodeuri.asp
	[NOTE] Decoding required for some browsers as Chrome and Opera;
	without decoding links with anchors will not open;
	scrollbar will move to top of page:
	https://stackoverflow.com/a/48218282/5951529
	###
	dechash = decodeURI(hash)
	if dechash
		# [INFO] Replacing to id, example:
		#  “#Кира” → “<a id="Кира">”
		element = document.getElementById(dechash.replace('#', ''))
		if element
			# [INFO] Scroll to id
			internals.scrollingElement.scrollTo 0, element.offsetTop
	return

# Listeners
window.onload = internals.initialize
window.onorientationchange = internals.handleOrientationChange

#################
# [DEPRECATED] ##
#################
# window.onload = function() {
#		 if (window.matchMedia("(orientation: landscape)").matches) {
#				 // For landscape orientation
#				 var landscapescrollbar = new GeminiScrollbar({
#						 // querySelector method — https://www.w3schools.com/jsref/met_document_queryselector.asp
#						 element: document.querySelector("main"),
#						 autoshow: true,
#						 // Force Gemini for correct scrollbar displaying in mobile devices
#						 // https://github.com/noeldelgado/gemini-scrollbar#options
#						 forceGemini: true,
#				 }).create();
#				 window.myscroolbar = landscapescrollbar;
#				 // JQuery Lazy support —
#				 // https://github.com/eisbehr-/jquery.lazy/issues/88#issuecomment-299138103
#				 $(".SashaLazy").Lazy({
#						 appendScroll: $(landscapescrollbar.getViewElement()),
#						 // Run method “update” of Gemini:
#						 // https://github.com/eisbehr-/jquery.lazy/issues/88#issuecomment-299196388
#						 // http://jquery.eisbehr.de/lazy/example_callback-functions
#						 // https://github.com/noeldelgado/gemini-scrollbar#basic-methods
#						 afterLoad: function() {
#								 landscapescrollbar.update();
#						 }
#				 });
#		 } else {
#				 // For portrait orientation
#				 var portraitscrollbar = new GeminiScrollbar({
#						 element: document.querySelector("body"),
#						 autoshow: true,
#						 forceGemini: true,
#				 }).create();
#				 window.myscroolbar = portraitscrollbar;
#				 $(".SashaLazy").Lazy({
#						 appendScroll: $(portraitscrollbar.getViewElement()),
#						 afterLoad: function() {
#								 portraitscrollbar.update();
#						 }
#				 });
#		 }
# };
# // Scrollbar works on resize
# // Thanks to Alfy — https://vk.com/dark_alf
# window.onresize = function() {
#		 if(window.myscroolbar)
#				 window.myscroolbar.destroy();
#		 window.onload();
# }

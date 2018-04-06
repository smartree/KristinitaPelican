######################
## grunt-humans-txt ##
######################
# Generate humans.txt file:
# https://www.npmjs.com/package/grunt-humans-txt
# http://humanstxt.org/
# [WARNING] Generator is outdated, you get a waning in console:
# “npm WARN grunt-humans-txt@0.2.1 requires a peer of grunt@~0.4.1 but none is installed. You must install peer dependencies yourself.”
# https://github.com/roughcoder/grunt-humans-txt/pull/7
# [NOTE] Needs “module.exports = (grunt) ->” instead of “module.exports =”, that don't get an error:
# “ReferenceError: grunt is not defined”
module.exports = (grunt) ->
	options:
		pkg: grunt.file.readJSON('package.json')
		intro: 'humans.txt file for Kristinita\'s Search'
		commentStyle: 'c'
		content:
			'team': [
				'Web developer': '<%= humans_txt.options.pkg.author %>'
				'Site': '<%= humans_txt.options.pkg.homepage %>'
				'Contacts': 'https://vk.com/hair_in_the_wind'
				'Location': 'Там, где Саша'
			]
			'thanks': [
				'Name': 'Alfy Centauri'
				'Site': 'alfavika.ru'
			]
			'site': [
				'Standards': 'HTML5, CoffeeScript, Stylus'
				'Components': 'Pelican, Python Markdown, Grunt, JQuery and many plugins for this components'
				'Software': 'Sublime Text and many plugins for Sublime Text'
				'License': '<%= humans_txt.options.pkg.license %>'
			]
	task:
		dest: 'output/humans.txt'
##########
# pylint #
##########
# Pylint — Python code analysis:
# https://www.pylint.org/
# Grunt wrapper:
# https://www.npmjs.com/package/grunt-pylint
# Options:
# https://www.npmjs.com/package/grunt-pylint#options
# [FIXME]
# pylint haven't glob by default:
# https://github.com/PyCQA/pylint/issues/352
# pylint works only if “__init__.py” in the folder:
# https://github.com/PyCQA/pylint/issues/2108
module.exports =

	options:
		# [INFO] Use pylint from pipenv
		externalPylint: true
		# [INFO] Path to pipenv virtual environment; pipenv packages doesn't work without it:
		# https://travis-ci.org/Kristinita/SashaGruntDebugging/builds/506827879\
		virtualenv: ".venv"
	# [INFO] Lint Pelican configuration files
	pelicanconfig:
		src: "*.py"
	# [INFO] Lint Python files of personal plugins
	personalpluginspelican:
		# [INFO] Get list item in Grunt template:
		# https://oncletom.io/2013/dynamic-grunt-targets-using-templates/
		# [INFO] Path for personal plugins
		src: ["<%= templates.yamlconfig.PLUGIN_PATHS[1] %>/**/*.py"
			# [NOTE] just_table is not my plugin, but I move to my, because issue doesn't solved:
			# https://github.com/burakkose/just_table/issues/7
			"!<%= templates.yamlconfig.PLUGIN_PATHS[1] %>/**/just_table.py"]

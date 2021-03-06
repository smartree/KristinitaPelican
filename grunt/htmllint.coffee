############
# htmllint #
############
###
Lint HTML:
http://htmllint.github.io/
https://www.npmjs.com/package/grunt-htmllint
Configuration:
https://github.com/htmllint/htmllint/wiki/Options
Inline options ignoring:
https://github.com/htmllint/htmllint/wiki/Inline-Configurations
[WARNING] 1 error — 1 toast. The number of toasts may be large!
https://github.com/htmllint/grunt-htmllint/issues/25
Run “htmllint” after “grunt” or “grunt publish” task, not after “pelican” command/
[DONE]
# [BUG] “opts” argument erroneous:
# https://github.com/htmllint/grunt-htmllint/pull/24
[NOTE] “attr-bans” modified, because Progressbar needs “style” attribute:
https://github.com/facelessuser/pymdown-extensions/issues/293
https://github.com/htmllint/htmllint/wiki/Options#attr-bans
[FIXME] Migrate to BEM → remove “id-class-style”
https://github.com/htmllint/htmllint/wiki/Options#id-class-style
[NOTE] “raw-ignore-regex” for ignoring linting inside style and script tags:
"raw-ignore-regex": "/(\\<script\\>.*\\<\/script\\>|\\<style\\>.*\\<\/style\\>)/",
https://github.com/htmllint/htmllint/issues/257
https://github.com/htmllint/htmllint/wiki/Options#raw-ignore-regex
[NOTE] This regex not work as expected:
"raw-ignore-regex": "/(\\<(script|style)\\>.*\\<\/(script|style)\\>|/"
[NOTE] “tag-bans” — I enable “style” tag, because it needest for speed performance:
https://developers.google.com/web/tools/lighthouse/audits/blocking-resources
https://github.com/htmllint/htmllint/wiki/Options#tag-bans
###
module.exports =
	options:
		# For correct exit codes for builds:
		# https://www.npmjs.com/package/grunt-htmllint#optionsforce
		force: false
		# Support configuration file “.htmllintrc”
		htmllintrc: true
	src: "<%= templates.paths.html %>"

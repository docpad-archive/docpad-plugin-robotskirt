# Export Plugin
module.exports = (BasePlugin) ->
	# Prepare
	rs = null

	# Define
	class RobotskirtPlugin extends BasePlugin
		# Name
		name: 'robotskirt'

		# Configuration
		config:
			robotskirtOptions:
				EXT_AUTOLINK: true
				EXT_FENCED_CODE: true
				EXT_LAX_SPACING: true
				EXT_NO_INTRA_EMPHASIS: true
				EXT_SPACE_HEADERS: true
				EXT_STRIKETHROUGH: true
				EXT_SUPERSCRIPT: true
				EXT_TABLES: true
				HTML_SKIP_HTML: false
				HTML_SKIP_STYLE: false
				HTML_SKIP_IMAGES: false
				HTML_SKIP_LINKS: false
				HTML_EXPAND_TABS: false
				HTML_SAFELINK: false
				HTML_TOC: false
				HTML_HARD_WRAP: false
				HTML_USE_XHTML: true
				HTML_ESCAPE: false
			smartypants: true
			highlight: false
			inline: false

		# Singleton Parser
		parser: null

		# Render some content
		render: (opts,next) ->
			# Prepare
			config = @config
			{inExtension,outExtension} = opts

			# Check our extensions
			if inExtension in ['md','markdown'] and outExtension in [null,'html']
				rs = require('robotskirt')  unless rs?

				# Create Parser
				unless @parser?
					renderer = new rs.HtmlRenderer()

					# highlight
					renderer.blockcode = config.highlight  if config.highlight

					# inline
					if config.inline
						renderer.normal_text = (src) ->
							blocks = []
							hash = (text) ->
								text = text.replace(/(^\n+|\n+$)/g,"")
								return "\n\n~K" + (blocks.push(text)-1) + "K\n\n"
							unhash = (src) ->
								src.replace /\n\n~K([0-9]+)K\n\n/g, (whole,m1) ->
									blocks[m1]

							out = config.inline(src, hash)
							out = unhash(out)  if blocks.length > 0
							out

					# robotskirt options
					opts = config.robotskirtOptions
					for name of opts
						if opts[name]
							if name.indexOf('EXT_') is 0
								extOpts = extOpts or []
								extOpts.push(rs[name])
							if name.indexOf('HTML_') is 0
								htmlOpts = htmlOpts or []
								htmlOpts.push(rs[name])

					# create
					@parser = new rs.Markdown(renderer, extOpts, htmlOpts);

				# Render
				opts.content = @parser.render(opts.content)

				# SmartyPants
				opts.content = rs.smartypantsHtml(opts.content)  if config.smartypants

			# Done
			next()

# Robotskirt Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/docpad/docpad-plugin-robotskirt/master.svg)](http://travis-ci.org/docpad/docpad-plugin-robotskirt "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-robotskirt.svg)](https://npmjs.org/package/docpad-plugin-robotskirt "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-robotskirt.svg)](https://npmjs.org/package/docpad-plugin-robotskirt "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/docpad/docpad-plugin-robotskirt.svg)](https://david-dm.org/docpad/docpad-plugin-robotskirt)
[![Dev Dependency Status](https://img.shields.io/david/dev/docpad/docpad-plugin-robotskirt.svg)](https://david-dm.org/docpad/docpad-plugin-robotskirt#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPal donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->

NOTE! [Robotskirt has become deprecated](https://github.com/benmills/robotskirt/issues/32#issuecomment-74920726) and replaced by [hoedown](https://github.com/hoedown/node-hoedown). Please use one of DocPad's other markdown [renderer plugins](https://docpad.org/docs/plugins#renderers).

[Markdown](http://daringfireball.net/projects/markdown/) rendering for [DocPad](https://docpad.org), using [Robotskirt](https://github.com/benmills/robotskirt)

Convention:	`.html.md|markdown`

> [Robotskirt is no longer supported.](https://github.com/benmills/robotskirt/issues/32#issuecomment-74920726)


<!-- INSTALL/ -->

## Install

``` bash
docpad install robotskirt
```

<!-- /INSTALL -->


## Configure
For information on customising your plugin configuration you can refer to the [DocPad FAQ](https://github.com/bevry/docpad/wiki/FAQ)

### Robotskirt Options
You can customise the [Robotskirt](https://github.com/benmills/robotskirt) options using the `robotskirtOptions` object. By default we use:

``` coffee
plugins:
	robotskirt:
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
```

### SmartyPants

It makes "smart" punctuation. See more on [its homepage](http://daringfireball.net/projects/smartypants). Default is true:

``` coffee
plugins:
	robotskirt:
		smartypants: true
```

### Hightlight

It supports highlighting code blocks at build time. Following is using [highlight.js](https://github.com/isagalaev/highlight.js).

``` coffee
plugins:
	robotskirt:
		highlight: (code, lang)->
			has = lang && hl.LANGUAGES.hasOwnProperty(lang.trim())

			open = if has then '<pre><code class="lang-'+lang.trim()+'">' else '<pre><code>'
			body = if has then hl.highlight(lang, code).value else hl.highlightAuto(code).value
			close = '</code></pre>'

			return open + body + close
```

### Inline

You can add your markup in only normal text blocks. Next example is Twitter tag exmaple. `@pismute` will be rendered `<a href="https://twitter.com/pismute">@pismute</a>`:

``` coffee
plugins:
	robotskirt:
		inline: (src, hash)->
			out = src

			#for people
			out = out.replace /(^|[ \t]+)@([a-zA-Z0-9]+)/g, (whole, m1, m2) ->
				hash m1 + '<a href="https://twitter.com/' + m2 + '">@' + m2 + '</a>'

			#for hash tag·
			out = out.replace /(^|[ \t]+)#([ㄱ-ㅎ가-힣a-zA-Z0-9]+)/g, (whole, m1, m2) ->
				hash m1 + '<a href="https://twitter.com/search?q=%23' + escapeURL(m2) + '&src=hash">#' + m2 + '</a>'

			return out
```

<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/docpad/docpad-plugin-robotskirt/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/docpad/docpad-plugin-robotskirt/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)
- Changwoo Park <pismute@gmail.com> (https://github.com/pismute)

### Sponsors

No sponsors yet! Will you be the first?

[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPal donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/docpad/docpad-plugin-robotskirt/commits?author=balupton)
- [Changwoo Park](https://github.com/pismute) <pismute@gmail.com> — [view contributions](https://github.com/docpad/docpad-plugin-robotskirt/commits?author=pismute)

[Become a contributor!](https://github.com/docpad/docpad-plugin-robotskirt/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)

<!-- /LICENSE -->



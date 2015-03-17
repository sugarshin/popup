# popup

[![Build Status](https://travis-ci.org/sugarshin/popup.svg?branch=master)](https://travis-ci.org/sugarshin/popup) [![Coverage Status](https://coveralls.io/repos/sugarshin/popup/badge.svg)](https://coveralls.io/r/sugarshin/popup) [![GitHub version](https://badge.fury.io/gh/sugarshin%2Fpopup.svg)](http://badge.fury.io/gh/sugarshin%2Fpopup) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

Popup

```shell
npm i sugarshin/popup
```

## Usage

```coffeescript
Popup = require 'popup'

new Popup
```

or

```html
<script src="popup.js"></script>
<script>
  new Popup;
</script>
```

### Config

```coffeescript
_defaults:
  width: 640
  height: 800
  url: null
  nameSuffix: '-popup'
```

## Contributing

[CoffeeScript](//coffeescript.org/)

[mocha-phantomjs](//github.com/metaskills/mocha-phantomjs)

[power-assert](//github.com/twada/power-assert)

```shell
npm test
```

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin

mocha-hierarchical-reporter
==========================

[![Build Status](https://travis-ci.org/anshulverma/mocha-hierarchical-reporter.svg?branch=0.0.2)](https://travis-ci.org/anshulverma/mocha-hierarchical-reporter)
[![Coverage Status](https://coveralls.io/repos/anshulverma/mocha-hierarchical-reporter/badge.png?branch=master)](https://coveralls.io/r/anshulverma/mocha-hierarchical-reporter?branch=master)
[![Dependency Status](https://gemnasium.com/anshulverma/mocha-hierarchical-reporter.svg)](https://gemnasium.com/anshulverma/mocha-hierarchical-reporter)
[![NPM version](https://badge.fury.io/js/hierarchical-reporter.svg)](http://badge.fury.io/js/hierarchical-reporter)

[![NPM](https://nodei.co/npm/hierarchical-reporter.png?stars=true&downloads=true)](https://nodei.co/npm/hierarchical-reporter/)

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [mocha-hierarchical-reporter](#mocha-hierarchical-reporter)
    - [Summary](#summary)
    - [Installation](#installation)
    - [Usage](#usage)
    - [Building](#building)
    - [Testing](#testing)
    - [Documentation](#documentation)
    - [Build + Test + Document](#build--test--document)
    - [Contributing](#contributing)
    - [Author](#author)
    - [License](#license)

<!-- markdown-toc end -->

## Summary

Reporter for mocha tests which prints the test statuses in a
hierarchical manner. This reporter is based on the `spec` reporter
provided by mocha. There are a few differences between this and `spec`:

- A failing test has a `x` in front of it. The failing index suffix has
  been moved to the end of line.

![Example report of failing tests](http://goo.gl/uqnA5L "Report of failing tests")

- The failures are reported in the end as in `spec`. The only difference
  is the name of the failed tests is shown in a hierarchy.

![Example report of failed test](https://raw.githubusercontent.com/anshulverma/mocha-hierarchical-reporter/master/images/failed-tests.png "Trace of a failed test")

- Object diff is reported properly with a deep colored diff of its
  contents.

![Example of object diff](https://raw.githubusercontent.com/anshulverma/mocha-hierarchical-reporter/master/images/object-diff.png "Object diff")

## Installation

Install using `npm` and save it as a development dependency:

> npm install hierarchical-reporter --save-dev

## Usage

Simply use the `--reporter` CLI option to specify the reporter you want
to use:

> mocha --reporter hierarchical-reporter test/*.js

## Building

To get the js source generated form coffee script:

``` bash
$ grunt coffee
```

This will put all js files in `lib` folder.

## Testing

To execute tests, make sure
[grunt](https://github.com/gruntjs/grunt-cli) is installed. Then run:

``` bash
$ grunt test
```

Before testing, this task will perform a lint check using
[coffeelint](http://www.coffeelint.org/).  Tests will be executed if and
only if linting succeeds.

The `default` task of `grunt` will run this command as well. So, just
typing `grunt` and pressing RET is also sufficient to run tests.

## Documentation

Documentation is generated using
[docco](https://github.com/jashkenas/docco) and placed in `docs`
folder. To build documentation:

``` bash
$ grunt docs
```

## Build + Test + Document

The `build` task of `grunt` will check linting, test everything,
generate docs and build javascript source. So, to execute:

``` bash
$ grunt build
```

## Contributing

Feel free to make a change and issue a pull request if you have a patch.

If you have a feature request or if you find a bug, please open a issue.

## Author

[Anshul Verma](http://anshulverma.github.io/) ::
[anshulverma](https://github.com/anshulverma) ::
[@anshulverma](http://twitter.com/anshulverma)

## License

The MIT License (MIT)

Copyright (c) 2014 Anshul Verma

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/anshulverma/mocha-hierarchical-reporter/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


global.assert  = require('chai').assert
{EventEmitter} = require 'events'

# We need to execute annotated source for coverage report generation. This can
# be determined using `NODE_ENV`.
coverageMode = process.env['NODE_ENV'] is 'coverage'
srcPath = if coverageMode then '../coverage/src' else '../src'

global.runner   = new EventEmitter
global.reporter = require("#{srcPath}/main") global.runner
global.logger   = require "#{srcPath}/logger"
global.util     = require "#{srcPath}/util"

# No need for colors while testing
util.useColors = false

# Replace ANSI symbols
util.symbols.ok  = '-'
util.symbols.err = '*'

# Buffer output for comparison instead of printing to console
class DummyBuffer
  constructor: ->
    @buffer = []

  write: (str) =>
    @buffer.push str

  flush: ->
    contents = @buffer.join '\n'
    @buffer = []
    contents

buffer = new DummyBuffer
global.buffer = buffer
global.logger.writer = buffer.write

preProcessExpectation = (expectation) ->
  expectation.replace /#/gm, ''                 # remove all '#' symbols

processExpectation = (expectation) ->
  processed = expectation
    .slice 1, expectation.length                # remove the starting line
    .replace /([\(\)\[\]\.\*])/g, '\\$1'        # escape regex symbols
    .replace /NNN/g, '[0-9]*'                   # any number regex
    .replace /STACKTRACE\n/gm, '(    at .*\n)+' # Stacktrace regex
  "^#{processed}$"

global.match = (actual, expected) ->
  expected = preProcessExpectation expected
  match = actual.match(processExpectation expected)
  assert.equal actual, expected unless match?

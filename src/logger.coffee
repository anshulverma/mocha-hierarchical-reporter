lifo = require 'lifo'
{color, colors, symbols, processError, getSpacing} = require './util'

class Logger
  constructor: ->
    @indentation = 0
    @writer = console.log

  print: (str) ->
    @writer "  #{getSpacing @indentation, 4}#{str}"

  log: (str) ->
    @print str

  pass: (str) ->
    @print "#{symbols.ok} #{color 'log', str}"

  fail: (str) ->
    @print "#{symbols.err} #{color 'fail', str}"

  indent: ->
    @indentation++

  unindent: ->
    @indentation-- if @indentation > 0

  showError: (err, test, index) ->
    titleStack = do lifo
    while test?
      titleStack.push test.title if test.title.length
      test = test.parent

    @log "#{index + 1}) #{do titleStack.pop}"
    spacing = 3
    until do titleStack.isEmpty
      title = do titleStack.pop
      @log "#{getSpacing spacing++, 2}#{title}"

    @indentation = 0
    @log ''

    {message, stack} = processError err
    @log color 'fail', "  #{message}"
    @log ''
    @log color 'fail', "#{stack}"

module.exports = new Logger

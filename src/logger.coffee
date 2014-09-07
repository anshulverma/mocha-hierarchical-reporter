{color, colors, symbols} = require './util'

class Logger
  constructor: ->
    @indentation = 0
    @writer = console.log

  print: (str) ->
    @writer "  #{Array(@indentation * 4).join ' '}#{str}"

  log: (str) ->
    @print str

  pass: (str) ->
    @print "#{symbols.ok} #{color 'log', str}"

  fail: (str) ->
    @print "#{symbols.err} #{color 'fail', str}"

  indent: ->
    @indentation++

  unindent: ->
    @indentation--

  showError: (err, index) ->
    message = err.message
    stack = err.stack
    messageIndex = stack.indexOf(message) + message.length
    message = stack.slice 0, messageIndex
    stack = (stack.slice messageIndex + 3, stack.length).replace /^/gm, '  '
    @log color 'fail', "#{index}) #{message}"
    @log color 'fail', "#{stack}"

module.exports = new Logger

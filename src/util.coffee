tty = require 'tty'

isatty = tty.isatty(1) and tty.isatty(2)
exports.useColors = isatty or (process.env.MOCHA_COLORS isnt undefined)

exports.color = (type, str, force = false) ->
  if exports.useColors or force
    "\u001b[#{exports.colors[type]}m#{str}\u001b[0m"
  else
    str

exports.colors =
  pass : 32
  fail : 31
  log  : 90

exports.symbols =
  ok  : exports.color 'pass', '✓'
  err : exports.color 'fail', '✖'

exports.processError = (err) ->
  message = err.message
  stack = err.stack
  messageIndex = stack.indexOf(message) + message.length
  message = stack.slice 0, messageIndex
  stack = (stack.slice messageIndex + 3, stack.length).replace /^/gm, '  '

  message: message
  stack: stack

exports.getSpacing = (count, size) ->
  Array(count * size).join ' '

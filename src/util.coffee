tty = require 'tty'

isatty = tty.isatty(1) and tty.isatty(2)
exports.useColors = isatty or (process.env.MOCHA_COLORS isnt undefined)

exports.color = (type, str, force = false) ->
  if exports.useColors or force
    "\u001b[#{exports.colors[type]}m#{str}\u001b[0m"
  else
    str

exports.colors =
  pass    : 32
  fail    : 31
  log     : 90
  removed : 41
  added   : 42

exports.symbols =
  ok  : exports.color 'pass', '✓'
  err : exports.color 'fail', '✖'

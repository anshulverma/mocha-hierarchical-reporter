logger = require './logger'
{color} = require './util'

module.exports = (runner) ->
  stats =
    passes: 0
    failures: 0

  errors = []

  runner.on 'start', ->
    stats.start = new Date

  runner.on 'suite', (suite) ->
    logger.log suite.title
    do logger.indent

  runner.on 'suite end', ->
    do logger.unindent
    logger.log '' if logger.indentation is 0

  runner.on 'pass', (test) ->
    stats.passes++
    logger.pass test.title

  runner.on 'fail', (test, err) ->
    stats.failures++
    logger.fail "#{test.title} (#{stats.failures})"
    errors.push
      test  : test
      err : err

  runner.on 'end', ->
    logger.showError error.err, error.test, index for error, index in errors

    duration = new Date - stats.start
    logger.log color 'pass', "#{stats.passes} passing (#{duration}ms)"
    logger.log color 'fail', "#{stats.failures} failing"

    stats.passes = stats.failures = 0
    errors = []

module.exports = (runner) ->
  passes = 0
  failures = 0

  runner.on 'pass', (test) ->
    passes++
    console.log "pass: #{do test.fullTitle}"

  runner.on 'fail', (test, err) ->
    failures++
    console.log "fail: #{do test.fullTitle}, message: #{err.message}"

  runner.on 'end', ->
    console.log "end: #{passes}/#{passes + failures}"
    process.exit failures

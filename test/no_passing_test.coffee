expectation =
"""
#
  suite one
     * test1 (1)
  #
  1) Error: forced to fail
    at Context.<anonymous> (/Users/ansverma/Workspace/mocha-hierarchical-reporter/test/no_passing_test.coffee:NNN:39)
    at callFn (/Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runnable.js:223:21)
    at Test.Runnable.run (/Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runnable.js:216:7)
    at Runner.runTest (/Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runner.js:373:10)
    at /Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runner.js:451:12
    at next (/Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runner.js:298:14)
    at /Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runner.js:308:7
    at next (/Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runner.js:246:23)
    at Object._onImmediate (/Users/ansverma/Workspace/mocha-hierarchical-reporter/node_modules/grunt-mocha-test/node_modules/mocha/lib/runner.js:275:5)
    at processImmediate [as _immediateCallback] (timers.js:330:15)
  #
  0 passing (NNNms)
  1 failing
"""

describe 'no passing reporter test', ->
  it 'no passing tests should be reported', ->
    mockTest = title: 'test1'
    mockSuite = title: 'suite one'

    runner.emit 'start'
    runner.emit 'suite', mockSuite
    runner.emit 'fail', mockTest, new Error 'forced to fail'
    runner.emit 'suite end'
    runner.emit 'end'

    match buffer.flush(), expectation

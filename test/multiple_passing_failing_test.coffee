expectation =
"""
#
  suite one
     * test1 (1)
     - test2
  #
  suite two
     - test3
     suite three
         - test4
     * test5 (2)
  #
  1) Error: forced to fail
    at Context.<anonymous> (/Users/ansverma/Workspace/mocha-hierarchical-reporter/test/multiple_passing_failing_test.coffee:NNN:40)
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
  2) Error: this is a test
    at Context.<anonymous> (/Users/ansverma/Workspace/mocha-hierarchical-reporter/test/multiple_passing_failing_test.coffee:NNN:40)
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
  3 passing (NNNms)
  2 failing
"""

describe 'multiple passing and failing', ->
  it 'test if all passing and failing are reported', ->
    mockTest1 = title: 'test1'
    mockTest2 = title: 'test2'
    mockTest3 = title: 'test3'
    mockTest4 = title: 'test4'
    mockTest5 = title: 'test5'
    mockSuite1 = title: 'suite one'
    mockSuite2 = title: 'suite two'
    mockSuite3 = title: 'suite three'

    runner.emit 'start'
    runner.emit 'suite', mockSuite1
    runner.emit 'fail', mockTest1, new Error 'forced to fail'
    runner.emit 'pass', mockTest2
    runner.emit 'suite end'
    runner.emit 'suite', mockSuite2
    runner.emit 'pass', mockTest3
    runner.emit 'suite', mockSuite3
    runner.emit 'pass', mockTest4
    runner.emit 'suite end'
    runner.emit 'fail', mockTest5, new Error 'this is a test'
    runner.emit 'suite end'
    runner.emit 'end'

    match buffer.flush(), expectation

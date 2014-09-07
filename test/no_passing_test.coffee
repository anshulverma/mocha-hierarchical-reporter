expectation =
"""
#
  suite one
     * test1 (1)
  #
  1) Error: forced to fail
STACKTRACE
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

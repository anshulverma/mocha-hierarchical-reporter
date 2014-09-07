expectation =
"""
#
  #{util.symbols.ok} test1
  1 passing (NNNms)
  0 failing
"""

describe 'no failures reporter test', ->
  it 'no failing tests should be reported', ->
    mockTest = title: 'test1'

    runner.emit 'start'
    runner.emit 'pass', mockTest
    runner.emit 'end'

    match buffer.flush(), expectation

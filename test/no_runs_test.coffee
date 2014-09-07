expectation =
"""
#
  0 passing (NNNms)
  0 failing
"""

describe 'no runs reporter test', ->
  it 'no passing and failing tests', ->
    runner.emit 'start'
    runner.emit 'end'

    match buffer.flush(), expectation

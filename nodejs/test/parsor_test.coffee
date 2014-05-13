require '../lib/parsor'

assert = require 'assert'
pr = require 'packrattle'

describe 'Parsor', ->
  it 'does you', ->
    assert.equal \
      expr.run "4+4"
      2



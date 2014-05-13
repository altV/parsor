pr = require 'packrattle'
# require 'parsimmon'

addition = pr.seq \
  ->{expr}
  '+'
  ->{expr}

global.expr = pr.alt(
  # pr.seq ->{expr}, '+', ->{expr}
  pr.seq \
    ->{expr}
    '+'
    ->{expr}
  '+'
  )


GLOBAL.Parsor =
  peg: 'hi'

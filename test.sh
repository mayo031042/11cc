#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./bin/11cc "$input" > bin/tmp.s
  gcc -o bin/tmp bin/tmp.s
  ./bin/tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 2 1+1
assert 3 5-2
assert 7 9-3+1
assert 5 30-45+20
assert 12 " 2  +  10 "
assert 10 "2*5"
assert 4 "12/3"
assert 3 "1 + (1*2)"
assert 4 "(1+1) * 2"
assert 4 "+1+3"
assert 3 "-3*4+15"

echo OK
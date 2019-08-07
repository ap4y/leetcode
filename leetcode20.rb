require 'minitest/autorun'

MATCHES = { ')' => '(', ']' => '[', '}' => '{' }

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  s.each_char do |char|
    if char == '[' || char == '(' || char == '{'
      stack.push(char)
    else
      return false if MATCHES[char] != stack.last
      stack.pop
    end
  end

  stack.size.zero?
end

class LeetcodeTest < Minitest::Test
  def test_is_valid
    assert(is_valid('()'))
    assert(is_valid('{}[{}]((){})(){}'))
    assert(is_valid('{}{}()[]'))
    assert(is_valid('{{}{}}'))
    assert(is_valid('(([]){})'))
    assert(is_valid('(([[{}]()]){})'))
    refute(is_valid(')'))
    refute(is_valid('[])'))
    assert(is_valid(''))
    assert(is_valid('()'))
    assert(is_valid('()[]{}'))
    refute(is_valid('(]'))
    refute(is_valid('([)]'))
    assert(is_valid('{[]}'))
  end
end

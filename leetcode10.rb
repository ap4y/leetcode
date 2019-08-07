require 'minitest/autorun'

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  return s.length.zero? if p.length.zero?

  has_match = s.length > 0 && ['.', s[0]].include?(p[0])
  if p.length >= 2 && p[1] == '*'
    is_match(s, p[2..-1]) || (has_match && is_match(s[1..-1], p))
  else
    has_match && is_match(s[1..-1], p[1..-1])
  end
end

class LeetcodeTest < Minitest::Test
  def test_is_match
    assert(is_match('aaa', 'aa*a'))
    assert(is_match('aaa', 'a*a'))
    assert(is_match('aaa', 'a*aa'))
    assert(is_match('aaa', 'a*aaa'))
    assert(is_match('aaa', 'ab*a*c*a'))
    assert(is_match('ab', '.*b'))
    refute(is_match('aaac', 'a*a'))
    refute(is_match('ab', '.*c'))
    refute(is_match('aa', 'a'))
    assert(is_match('aa', 'a*'))
    assert(is_match('ab', '.*'))
    assert(is_match('aab', 'c*a*b*'))
    refute(is_match('mississippi', 'mis*is*p*.'))
    refute(is_match('aa', ''))
    refute(is_match('', 'a'))
    assert(is_match('', ''))
  end
end

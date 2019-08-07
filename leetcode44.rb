require 'minitest/autorun'

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  true
end

class LeetcodeTest < Minitest::Test
  def test_is_match
    refute('aa', 'a')
    assert('aa', '*')
    refute('cb', '?a')
    assert('adceb', '*a*b')
    refute('acdcb', 'a*c?b')
  end
end

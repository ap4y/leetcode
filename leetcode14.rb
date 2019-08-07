require 'minitest/autorun'

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.length == 0
  prefix = ''
  lead = strs.shift
  loop do
    idx = prefix.length
    break if idx == lead.length
    strs.each do |str|
      return prefix if idx > str.length || str[idx] != lead[idx]
    end
    prefix << lead[idx]
  end
  prefix
end

class LeetcodeTest < Minitest::Test
  def test_longest_common_prefix
    assert_equal('', longest_common_prefix([]))
    assert_equal('fl', longest_common_prefix(%w[flower flow flight]))
    assert_equal('f', longest_common_prefix(%w[flower f flight]))
    assert_equal('', longest_common_prefix(%w[dog racecar car]))
  end
end

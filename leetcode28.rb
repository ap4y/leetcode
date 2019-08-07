require 'minitest/autorun'

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.length.zero?

  left, right = 0, needle.size - 1
  while right < haystack.size
    return left if haystack[left..right] == needle
    left += 1
    right += 1
  end
  -1
end

class LeetcodeTest < Minitest::Test
  def test_str_str
    assert_equal(9, str_str('mississippi', 'pi'))
    assert_equal(0, str_str('a', 'a'))
    assert_equal(-1, str_str('hello', 'wa'))
    assert_equal(0, str_str('a', ''))
    assert_equal(2, str_str('hello', 'll'))
    assert_equal(-1, str_str('aaaaa', 'bba'))
    assert_equal(0, str_str('', ''))
    assert_equal(-1, str_str('', 'a'))
  end
end

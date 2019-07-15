require 'minitest/autorun'

def expand(chars, left_idx, right_idx)
  left, right = left_idx, right_idx
  while chars[left] == chars[right] && left >= 0 && right < chars.size
    left -= 1
    right += 1
  end
  right - left
end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  chars, result = s.chars, []
  chars.each_with_index do |char, idx|
    len1 = (expand(chars, idx, idx) - 1) / 2
    len2 = (expand(chars, idx, idx + 1) - 2) / 2

    palindrome =
      if len1 > len2
        chars[(idx - len1)..(idx + len1)]
      else
        chars[(idx - len2)..(idx + 1 + len2)]
      end

    result = palindrome if result.size < palindrome.size
  end
  result.join
end

class LeetcodeTest < Minitest::Test
  def test_longest_palindrome
    assert_equal('bab', longest_palindrome('babad'))
    assert_equal('aaaa', longest_palindrome('aaaa'))
    assert_equal('bb', longest_palindrome('cbbd'))
  end
end

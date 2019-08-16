require 'minitest/autorun'

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  left, right = 0, s.size - 1

  while left < right
    left += 1 while left < right && !alphanum?(s[left])
    right -= 1 while left < right && !alphanum?(s[right])
    return false unless s[left].downcase == s[right].downcase
    left += 1
    right -= 1
  end
  true
end

def alphanum?(char)
  return false unless char
  ord = char.ord
  ord.between?(48, 57) || ord.between?(65, 90) || ord.between?(97, 122)
end

class LeetcodeTest < Minitest::Test
  def test_is_palindrome
    assert(is_palindrome('A man, a plan, a canal: Panama'))
    refute(is_palindrome('race a car'))
    assert(is_palindrome(''))
    assert(is_palindrome('.,'))
  end
end

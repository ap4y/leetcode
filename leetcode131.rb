require 'minitest/autorun'

# @param {String} s
# @return {String[][]}
def partition(s, head = [])
  return [head] if s.length.zero?
  puts "#{s}"

  idx, result = 0, []
  while idx < s.length
    if palindrome?(s[0..idx])
      result += partition(s[(idx + 1)..-1], head + [s[0..idx]])
    end
    idx += 1
  end

  result
end

def palindrome?(s)
  left, right = 0, s.length - 1
  while left < right
    return false unless s[left] == s[right]
    left += 1
    right -= 1
  end
  true
end

class LeetcodeTest < Minitest::Test
  def test_partition
    assert_equal([[]], partition(''))
    assert_equal([%w[a]], partition('a'))
    assert_equal([%w[a b]], partition('ab'))
    assert_equal([%w[a a b], %w[aa b]], partition('aab'))
    assert_equal([%w[a a b a], %w[a aba], %w[aa b a]], partition('aaba'))
    assert_equal(
      [%w[a a b b a], %w[a a bb a], %w[a abba], %w[aa b b a], %w[aa bb a]],
      partition('aabba')
    )
    assert_equal(
      [
        %w[a a b b a a],
        %w[a a b b aa],
        %w[a a bb a a],
        %w[a a bb aa],
        %w[a abba a],
        %w[aa b b a a],
        %w[aa b b aa],
        %w[aa bb a a],
        %w[aa bb aa],
        %w[aabbaa]
      ],
      partition('aabbaa')
    )
  end
end

# aabaa
# aabbaa

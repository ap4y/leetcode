require 'minitest/autorun'
require 'minitest/benchmark'

def length_of_longest_substring(s)
  result = 0
  start_idx = 0
  hash = {}
  s.chars.each_with_index do |char, idx|
    dup_idx = hash[char]
    start_idx = dup_idx + 1 if dup_idx && dup_idx >= start_idx

    hash[char] = idx
    # puts "#{char}: #{hash}, #{start_idx}..#{idx}, #{s[start_idx..idx]}"
    result = [result, idx + 1 - start_idx].max
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_length_of_longest_substring
    assert_equal(5, length_of_longest_substring('tmmzuxt'))
    assert_equal(2, length_of_longest_substring('abba'))
    assert_equal(3, length_of_longest_substring('abcabcbb'))
    assert_equal(1, length_of_longest_substring('bbbbb'))
    assert_equal(3, length_of_longest_substring('pwwkew'))
    assert_equal(3, length_of_longest_substring('dvdf'))
    assert_equal(1, length_of_longest_substring(' '))
    assert_equal(3, length_of_longest_substring('abcbbcbb'))
  end
end

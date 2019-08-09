require 'minitest/autorun'

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  result = ''
  left, right = 0, 0
  need = {}
  t.each_char { |char| need[char] = (need[char] || 0) + 1 }
  count = need.dup

  loop do
    left += 1 until left == s.length || count[s[left]]
    break if left == s.length

    s[left...right].each_char do |char|
      next unless need[char]
      need[char] -= 1 if need[char] > 0
      need.delete(char) if need[char].zero?
    end

    if need.size > 0
      while right < s.length && need.size > 0
        if need[s[right]]
          need[s[right]] -= 1 if need[s[right]] > 0
          need.delete(s[right]) if need[s[right]].zero?
        end
        right += 1
      end
    end

    if need.size.zero?
      match = s[left...right]
      result = match if result == '' || match.length < result.length
    end

    need.each { |k, _| need[k] = count[k] }
    need[s[left]] = count[s[left]]
    left += 1
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_min_window
    assert_equal('BANC', min_window('ADOBECODEBANC', 'ABC'))
    assert_equal('ADOBEC', min_window('ADOBECODEBANC', 'ABCD'))
    assert_equal('ADOBEC', min_window('ADOBECODEBANC', 'ABCDO'))
    assert_equal('DEBANC', min_window('ADOBECODEBANC', 'ABCDN'))
    assert_equal('BECODEBA', min_window('ADOBECODEBANC', 'ABBC'))
    assert_equal('', min_window('ADOBECODEBANC', 'ABCZ'))
    assert_equal('', min_window('ADO', 'AZ'))
    assert_equal('', min_window('ADO', 'Z'))
    assert_equal('', min_window('', 'A'))
    assert_equal('ba', min_window('bba', 'ab'))
    assert_equal('aa', min_window('aa', 'aa'))
    assert_equal('b', min_window('ab', 'b'))
    assert_equal('a', min_window('a', 'a'))
    assert_equal('', min_window('a', 'aa'))
  end
end

require 'minitest/autorun'

# @param {String} s
# @return {Integer}
def num_decodings(s)
  traverse({}, 0, s)
end

def traverse(acc, idx, s)
  puts "#{idx}, #{acc}"
  return 0 if s[0] == '0'
  return 1 if s.length <= 1
  return acc[idx] if acc[idx]

  result = traverse(acc, idx + 1, s[1..-1])
  result += traverse(acc, idx + 2, s[2..-1]) if s[0..1] <= '26'
  acc[idx] = result
  result
end

class LeetcodeTest < Minitest::Test
  def test_num_decodings
    assert_equal(0, num_decodings('0'))
    assert_equal(0, num_decodings('01'))
    assert_equal(1, num_decodings('1'))
    assert_equal(1, num_decodings('10'))
    assert_equal(1, num_decodings('27'))
    assert_equal(2, num_decodings('12'))
    assert_equal(3, num_decodings('226'))
    assert_equal(2, num_decodings('227'))
    assert_equal(2, num_decodings('93715976'))

    assert_equal(
      3_981_312,
      num_decodings(
        '9371597631128776948387197132267188677349946742344217846154932859125134924241649584251978418763151253'
      )
    )
  end
end

# 2 26
# 2 2 6

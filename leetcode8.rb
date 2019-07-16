require 'minitest/autorun'

# @param {String} str
# @return {Integer}
def my_atoi(str)
  max_val = 2**31
  mul, num = 0, 0
  has_num = false
  str.chars.each do |char|
    next if !has_num && char == ' '

    if !has_num && (char == '-' || char == '+')
      mul = char == '-' ? -1 : 1
      has_num = true
      next
    end

    code = char.ord
    break if code < 48 || code > 57
    has_num = true

    (num = max_val) && break if num > max_val / 10
    num *= 10

    add = code - 48
    (num = max_val) && break if num > max_val - add
    num += add
  end
  num -= 1 if mul != -1 && num == max_val
  num *= mul if mul != 0
  num
end

class LeetcodeTest < Minitest::Test
  def test_my_atoi
    assert_equal(0, my_atoi('0-1'))
    assert_equal(0, my_atoi('-   234'))
    assert_equal(0, my_atoi('   +0 123'))
    assert_equal(0, my_atoi('-+1'))
    assert_equal(0, my_atoi('+-2'))
    assert_equal(1, my_atoi('+1'))
    assert_equal(42, my_atoi('42'))
    assert_equal(-42, my_atoi('   -42'))
    assert_equal(4_193, my_atoi('4193 with words'))
    assert_equal(0, my_atoi('words and 987'))
    assert_equal(-2_147_483_648, my_atoi('-91283472332'))
    assert_equal(2_147_483_647, my_atoi('91283472332'))
  end
end

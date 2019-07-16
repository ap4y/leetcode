require 'minitest/autorun'

# @param {Integer} x
# @return {Integer}
def reverse(x)
  mul = x.negative? ? -1 : 1
  num = x * mul

  max_val = 2**31
  sum = 0
  loop do
    mod = num % 10

    sum *= 10
    return 0 if sum >= max_val - mod
    sum += mod

    num /= 10
    break if num == 0
    return 0 if sum > max_val / 10
  end
  sum * mul
end

class LeetcodeTest < Minitest::Test
  def test_reverse
    assert_equal(321, reverse(123))
    assert_equal(4_321, reverse(1_234))
    assert_equal(4_325, reverse(5_234))
    assert_equal(21, reverse(120))
    assert_equal(-321, reverse(-123))
    assert_equal(0, reverse(1_534_236_469))
    assert_equal(0, reverse(-2**31))
    assert_equal(2_147_483_641, reverse(1_463_847_412))
  end
end

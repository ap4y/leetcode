# coding: utf-8
require 'minitest/autorun'

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  return 1 if dividend == divisor
  return 2**31 - 1 if dividend == -2**31 && divisor == -1

  mul1 = dividend < 0 ? -1 : 1
  mul2 = divisor < 0 ? -1 : 1
  num1, num2 = dividend.abs, divisor.abs

  result = 0

  while num1 >= num2
    pow = 0
    pow += 1 while num1 >= num2 << pow

    num1 -= num2 << (pow - 1)
    result += 1 << (pow - 1)
  end
  result * mul1 * mul2
end

class LeetcodeTest < Minitest::Test
  def test_divide
    assert_equal(2, divide(7, 3))
    assert_equal(3, divide(10, 3))
    assert_equal(-2, divide(7, -3))
    assert_equal(2, divide(-7, -3))
    assert_equal(0, divide(0, 1))
    assert_equal(0, divide(2, 3))
    assert_equal(1, divide(3, 3))
    assert_equal(715_827_882, divide(2**31 - 1, 3))
    assert_equal(-715_827_882, divide(-2**31, 3))
  end
end

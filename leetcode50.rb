require 'minitest/autorun'

# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1.0 if n.zero?

  half = n.negative? ? my_pow(1 / x, -n / 2) : my_pow(x, n / 2)
  remainder = n % 2 == 0 ? 1 : n > 0 ? x : 1 / x
  half * half * remainder
end

class LeetcodeTest < Minitest::Test
  def test_my_pow
    assert_in_delta(1024.0, my_pow(2.0, 10))
    assert_in_delta(9.261, my_pow(2.1, 3))
    assert_in_delta(0.25, my_pow(2.0, -2))
    assert(my_pow(0.0, -2).infinite?)
    assert_in_delta(1.0, my_pow(2.0, 0))
    assert(my_pow(0.00001, -2_147_483_647).infinite?)
    assert_in_delta(0.0, my_pow(0.00001, 2_147_483_647))
  end
end

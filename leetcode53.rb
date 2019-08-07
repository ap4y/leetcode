require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  sum = nums.shift
  result = sum

  nums.each do |num|
    sum = [sum + num, num].max
    result = [result, sum].max
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_my_pow
    assert_equal(6, max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
    assert_equal(6, max_sub_array([1, 2, -1, -2, 2, 1, -2, 1, 4, -5, 4]))
    assert_equal(-1, max_sub_array([-2, -1]))
    assert_equal(0, max_sub_array([-1, 0, -2]))
    assert_equal(1, max_sub_array([-2, 1]))
    assert_equal(6, max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
    assert_equal(20, max_sub_array([-2, 1, -3, 4, -1, 2, 1, 10, 4]))
    assert_equal(-2, max_sub_array([-2]))
  end
end

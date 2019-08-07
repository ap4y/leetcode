require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  result = 1
  buf = Array.new(nums.size) { false }
  nums.each do |num|
    next unless num.positive?
    next if num > nums.size
    buf[num - 1] = true
    result += 1 while buf[result - 1] if result == num
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_first_missing_positive
    assert_equal(3, first_missing_positive([1, 2, 0]))
    assert_equal(2, first_missing_positive([3, 4, -1, 1]))
    assert_equal(4, first_missing_positive([3, 2, -1, 1]))
    assert_equal(1, first_missing_positive([7, 8, 9, 11, 12]))
    assert_equal(1, first_missing_positive([]))
    assert_equal(1, first_missing_positive([2_147_483_647]))
  end
end

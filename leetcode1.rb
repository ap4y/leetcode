require 'minitest/autorun'

def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, idx|
    complement = target - num
    return [hash[complement], idx] if hash[complement]
    hash[num] = idx
  end
  []
end

class LeetcodeTest < Minitest::Test
  def test_two_sum
    assert_equal([1, 3], two_sum([-3, 0, -8, 3, -3], 3))
    assert_equal([0, 4], two_sum([-3, 0, -8, 3, -3], -6))
    assert_equal([0, 3], two_sum([-3, 0, -8, 3, -3], 0))
    assert_equal([0, 2], two_sum([-10, 7, 19, 15], 9))
  end
end

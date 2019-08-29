require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer}
# def majority_element(nums)
#   hash = {}
#   nums.each do |num|
#     hash[num] ||= 0
#     hash[num] += 1
#     return num if hash[num] > nums.size / 2
#   end
#   -1
# end

def majority_element(nums)
  nums.sort[nums.size / 2]
end

class LeetcodeTest < Minitest::Test
  def test_majority_element
    assert_equal(3, majority_element([3, 2, 3]))
    assert_equal(2, majority_element([2, 2, 1, 1, 1, 2, 2]))
  end
end

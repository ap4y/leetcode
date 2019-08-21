require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer}
# def single_number(nums)
#   hash = {}
#   nums.each do |num|
#     hash[num] ||= 0
#     hash[num] += 1
#     hash.delete(num) if hash[num] == 2
#   end

#   hash.keys.first || 0
# end

def single_number(nums)
  sorted = nums.sort
  while sorted.size > 0
    num1, num2 = sorted.shift(2)
    return num1 if num1 != num2
  end
  0
end

class LeetcodeTest < Minitest::Test
  def test_single_number
    assert_equal(1, single_number([2, 2, 1]))
    assert_equal(4, single_number([4, 1, 2, 1, 2]))
    assert_equal(0, single_number([2, 2, 1, 1]))
  end
end

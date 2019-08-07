require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  distance = 0
  nums.each_with_index do |num, idx|
    puts "#{distance}, #{idx}, #{num}"
    return false if idx > distance
    distance = [distance, idx + num].max
  end
  true
end
# def can_jump(nums)
#   check({}, nums, 0)
# end

# def check(acc, nums, start)
#   return acc[start] if acc.key?(start)
#   puts "#{nums}, #{start}, #{acc}"
#   return true if nums.size.zero?
#   return nums.size == 1 if nums.first.zero?

#   max = nums.shift
#   max.times do |idx|
#     result = check(acc, nums[idx..-1], start + idx + 1)
#     acc[start + idx + 1] = result
#     return true if result
#   end
#   false
# end

class LeetcodeTest < Minitest::Test
  def test_can_jump
    # assert(can_jump([0]))
    # assert(can_jump([2, 0]))
    # assert(can_jump([2, 3, 1, 1, 4]))
    refute(can_jump([3, 2, 1, 0, 4]))
  end
end

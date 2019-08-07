require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  idx, right_cnt = 0, 0
  while idx + right_cnt < nums.size
    num = nums[idx]
    if num == 0
      nums.unshift(nums.delete_at(idx))
      idx += 1
    elsif num == 2
      nums.push(nums.delete_at(idx))
      right_cnt += 1
    else
      idx += 1
    end
  end
end

class LeetcodeTest < Minitest::Test
  def test_sort_colors
    nums = [2, 0, 2, 1, 1, 0]
    sort_colors(nums)
    assert_equal([0, 0, 1, 1, 2, 2], nums)

    nums = []
    sort_colors(nums)
    assert_equal([], nums)

    nums = [1, 2, 0]
    sort_colors(nums)
    assert_equal([0, 1, 2], nums)
  end
end

# 2, 0, 2, 1, 1, 0
# 0, 2, 1, 1, 0, 2
# 0, 1, 1, 0, 2, 2

# 0: 1, 0, 2, 1, 1, 0
# 1: 1, 0, 2, 1, 1, 0
# 2: 0, 1, 2, 1, 1, 0
# 2: 0, 1, 1, 1, 0, 2
# 3: 0, 1, 1, 1, 0, 2
# 4: 0, 1, 1, 1, 0, 2
# 5: 0, 0, 1, 1, 1, 2

# 4: 0, 0, 1, 1, 2, 2
# 5: 0, 0, 1, 1, 2, 2

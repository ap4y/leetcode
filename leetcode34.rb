require 'minitest/autorun'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  left, right = 0, nums.size - 1
  idx = -1
  while left <= right
    mid = (left + right) / 2
    if nums[mid] < target
      left += 1
    elsif nums[mid] > target
      right -= 1
    else
      idx = mid
      break
    end
  end

  return [-1, -1] if idx == -1

  left, right = idx, idx
  left -= 1 while left >= 0 && nums[left] == target
  right += 1 while right <= nums.size - 1 && nums[right] == target
  [left + 1, right - 1]
end

class LeetcodeTest < Minitest::Test
  def test_search_range
    assert_equal([0, 0], search_range([1], 1))
    assert_equal([-1, -1], search_range([1], 2))
    assert_equal([-1, -1], search_range([], 8))
    assert_equal([3, 4], search_range([5, 7, 7, 8, 8, 10], 8))
    assert_equal([3, 5], search_range([5, 7, 7, 8, 8, 8, 10], 8))
    assert_equal([3, 3], search_range([5, 7, 7, 8, 10], 8))
    assert_equal([0, 0], search_range([5, 7, 7, 8, 8, 10], 5))
    assert_equal([5, 5], search_range([5, 7, 7, 8, 8, 10], 10))
    assert_equal([-1, -1], search_range([5, 7, 7, 8, 8, 10], 6))
  end
end

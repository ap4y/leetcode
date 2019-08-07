require 'minitest/autorun'

def binary_search(nums, target, left, right)
  while left <= right
    mid = (left + right) / 2
    if target < nums[mid]
      right = mid - 1
    elsif target > nums[mid]
      left = mid + 1
    else
      return mid
    end
  end
  -1
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 if nums.size.zero?
  return nums.first == target ? 0 : -1 if nums.size == 1

  left, right = 0, nums.size - 1
  pivot = -1
  while left <= right
    if nums[left + 1] < nums[left]
      pivot = left
      break
    end

    if nums[right - 1] > nums[right]
      pivot = right - 1
      break
    end

    left += 1
    right -= 1
  end

  pivot = nums.size - 1 if pivot == -1
  if target >= nums.first
    binary_search(nums, target, 0, pivot)
  else
    binary_search(nums, target, pivot + 1, nums.size - 1)
  end
end

class LeetcodeTest < Minitest::Test
  def test_search
    assert_equal(-1, search([1], 0))
    assert_equal(0, search([1], 1))
    assert_equal(1, search([3, 1], 1))
    assert_equal(1, search([1, 3], 3))
    assert_equal(-1, search([], 5))
    assert_equal(2, search([6, 7, 0, 1, 2, 4, 5], 0))
    assert_equal(-1, search([6, 7, 0, 1, 2, 4, 5], 8))
    assert_equal(1, search([6, 7, 0, 1, 2, 4, 5], 7))
    assert_equal(2, search([6, 7, 0, 1, 2, 4, 5], 0))
    assert_equal(0, search([6, 7, 0, 1, 2, 4, 5], 6))
    assert_equal(4, search([4, 5, 6, 7, 0, 1, 2], 0))
    assert_equal(-1, search([4, 5, 6, 7, 0, 1, 2], 3))
  end
end

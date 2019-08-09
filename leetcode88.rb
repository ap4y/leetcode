require 'minitest/autorun'

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  idx1, idx2, target = m - 1, n - 1, m + n - 1
  while idx2 >= 0
    puts "#{idx1}, #{idx2}, #{target}, #{nums1}, #{nums2}"
    if idx1 >= 0 && nums1[idx1] > nums2[idx2]
      nums1[target] = nums1[idx1]
      idx1 -= 1
    else
      nums1[target] = nums2[idx2]
      idx2 -= 1
    end
    target -= 1
  end
end

class LeetcodeTest < Minitest::Test
  def test_merge
    nums1, nums2 = [2, 0], [1]
    merge(nums1, 1, nums2, 1)
    assert_equal([1, 2], nums1)

    nums1, nums2 = [1, 2, 3, 0, 0, 0], [2, 5, 6]
    merge(nums1, 3, nums2, 3)
    assert_equal([1, 2, 2, 3, 5, 6], nums1)

    nums1, nums2 = [1, 5, 6, 0, 0, 0], [2, 3, 7]
    merge(nums1, 3, nums2, 3)
    assert_equal([1, 2, 3, 5, 6, 7], nums1)

    nums1, nums2 = [1, 5, 6, 0, 0, 0], [2, 3, 3]
    merge(nums1, 3, nums2, 3)
    assert_equal([1, 2, 3, 3, 5, 6], nums1)
  end
end

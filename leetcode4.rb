require 'minitest/autorun'

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  arr = []
  idx1, idx2 = 0, 0
  while idx1 < nums1.size || idx2 < nums2.size
    num1, num2 = (nums1[idx1] || Float::MAX), (nums2[idx2] || Float::MAX)
    if num1 < num2
      arr << num1
      idx1 += 1
    else
      arr << num2
      idx2 += 1
    end
  end

  len = arr.size
  (arr[(len - 1) / 2] + arr[len / 2]) / 2.0
end

class LeetcodeTest < Minitest::Test
  def test_find_median_sorted_arrays
    assert_equal(2.0, find_median_sorted_arrays([1, 3], [2]))
    assert_equal(2.5, find_median_sorted_arrays([1, 2], [3, 4]))
  end
end

require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.size == 0

  idx, size = 0, nums.size

  prev = nums.shift
  nums << prev

  while idx < size - 1
    idx += 1
    num = nums.shift
    next if num == prev
    nums << num
    prev = num
  end
  nums.size
end

class LeetcodeTest < Minitest::Test
  def test_remove_duplicates
    assert_equal(0, remove_duplicates([]))
    assert_equal(2, remove_duplicates([1, 1, 2]))
    assert_equal(5, remove_duplicates([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]))
  end
end

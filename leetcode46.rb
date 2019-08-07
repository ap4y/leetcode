require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  acc = []
  nums.each_with_index do |num, idx|
    find_perm(acc, [num], nums[0...idx] + nums[(idx + 1)..-1])
  end
  acc
end

def find_perm(acc, perm, nums)
  if nums.size.zero?
    acc << perm
    return perm
  end

  nums.each_with_index do |other, idx|
    find_perm(acc, perm + [other], nums[0...idx] + nums[(idx + 1)..-1])
  end
end

class LeetcodeTest < Minitest::Test
  def test_permute
    assert_equal(
      [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]],
      permute([1, 2, 3])
    )

    assert_equal(
      [
        [1, 2, 3, 4],
        [1, 2, 4, 3],
        [1, 3, 2, 4],
        [1, 3, 4, 2],
        [1, 4, 2, 3],
        [1, 4, 3, 2],
        [2, 1, 3, 4],
        [2, 1, 4, 3],
        [2, 3, 1, 4],
        [2, 3, 4, 1],
        [2, 4, 1, 3],
        [2, 4, 3, 1],
        [3, 1, 2, 4],
        [3, 1, 4, 2],
        [3, 2, 1, 4],
        [3, 2, 4, 1],
        [3, 4, 1, 2],
        [3, 4, 2, 1],
        [4, 1, 2, 3],
        [4, 1, 3, 2],
        [4, 2, 1, 3],
        [4, 2, 3, 1],
        [4, 3, 1, 2],
        [4, 3, 2, 1]
      ],
      permute([1, 2, 3, 4])
    )
  end
end

# 1             2             3
# 1,2    1,3    2,1    2,3    3,1    3,2
# 1,2,3  1,3,2  2,1,3  2,3,1  3,1,2  3,2,1

# 1
# 1,2               1,3              1,4
# 1,2,3    1,2,4    1,3,2    1,3,4   1,4,2    1,4,3
# 1,2,3,4  1,2,4,3  1,3,2,4  1,3,4,2 1,4,2,3  1,4,3,2

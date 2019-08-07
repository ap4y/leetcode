require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  acc = {}
  traverse(acc, [], nums)
  acc.keys + [[]]
end

def traverse(acc, el, nums)
  puts "#{el}, #{nums}"
  nums.each_with_index do |num, idx|
    key = (el + [num]).sort
    next if acc[key]
    acc[key] = true
    traverse(acc, key, nums[0...idx] + nums[idx + 1..-1])
  end
end

class LeetcodeTest < Minitest::Test
  def test_subsets
    assert_equal(
      [
        [],
        [1],
        [2],
        [1, 2],
        [3],
        [1, 3],
        [2, 3],
        [1, 2, 3],
        [4],
        [1, 4],
        [2, 4],
        [1, 2, 4],
        [3, 4],
        [1, 3, 4],
        [2, 3, 4],
        [1, 2, 3, 4]
      ].sort,
      subsets([1, 2, 3, 4]).sort
    )
    assert_equal(
      [[3], [1], [2], [1, 2, 3], [1, 3], [2, 3], [1, 2], []].sort,
      subsets([1, 2, 3]).sort
    )
  end
end

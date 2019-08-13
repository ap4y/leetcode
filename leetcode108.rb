require 'minitest/autorun'
require './tree_node'

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  return nil if nums.size.zero?

  mid = nums.size / 2
  left, right = nums[0...mid], nums[mid + 1..-1]
  node = TreeNode.new(nums[mid])
  node.left = sorted_array_to_bst(left)
  node.right = sorted_array_to_bst(right)
  node
end

class LeetcodeTest < Minitest::Test
  def test_sorted_array_to_bst
    assert_equal(
      [0, -3, 9, -10, nil, 5],
      sorted_array_to_bst([-10, -3, 0, 5, 9]).to_a
    )

    assert_equal(
      [0, -8, 9, -10, -3, 5, 11],
      sorted_array_to_bst([-10, -8, -3, 0, 5, 9, 11]).to_a
    )
    assert_equal([], sorted_array_to_bst([]).to_a)
  end
end

# [-10, -8, -3, 0, 5, 9, 11]
#
#       0
#      /  \
#    -8    9
#    / \  / \
#  -10 -3 5  11

require 'minitest/autorun'
require './tree_node'

# @param {TreeNode} root
# @return {Integer[][]}
# def zigzag_level_order(root)
#   return [] if root.nil?
#   reverse = false
#   result, stack = [], [root]
#   while stack.size > 0
#     level =
#       stack.shift(stack.size).map do |node|
#         stack << node.left if node.left
#         stack << node.right if node.right
#         node.val
#       end

#     result << (reverse ? level.reverse : level)
#     reverse = !reverse
#   end
#   result
# end

def zigzag_level_order(root)
  return [] if root.nil?
  reverse = false
  result, stack = [], [root]
  while stack.size > 0
    result <<
      stack.shift(stack.size).each_with_object([]) do |node, acc|
        stack << node.left if node.left
        stack << node.right if node.right
        reverse ? acc.unshift(node.val) : acc.push(node.val)
      end
    reverse = !reverse
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_zigzag_level_order
    assert_equal(
      [[3], [20, 9], [16, 8, 15, 7]],
      zigzag_level_order(TreeNode.from_a([3, 9, 20, 16, 8, 15, 7]))
    )
    assert_equal(
      [[1], [3, 2], [4, 5]],
      zigzag_level_order(TreeNode.from_a([1, 2, 3, 4, nil, nil, 5]))
    )
    assert_equal(
      [[3], [20, 9], [15, 7]],
      zigzag_level_order(TreeNode.from_a([3, 9, 20, nil, nil, 15, 7]))
    )
    assert_equal([], zigzag_level_order(nil))
  end
end

#       3
#      / \
#     9   20
#    / \ /  \
#  16  8 15  7

require 'minitest/autorun'
require './tree_node'

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?
  result, stack = [], [root]
  while stack.size > 0
    result <<
      stack.shift(stack.size).map do |node|
        stack << node.left if node.left
        stack << node.right if node.right
        node.val
      end
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_level_order
    assert_equal(
      [[3], [9, 20], [15, 7]],
      level_order(TreeNode.from_a([3, 9, 20, nil, nil, 15, 7]))
    )
    assert_equal([], level_order(nil))
  end
end

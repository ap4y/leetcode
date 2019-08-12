require 'minitest/autorun'
require './tree_node'

# @param {TreeNode} root
# @return {Integer[]}
# def inorder_traversal(root)
#   return [] unless root
#   inorder_traversal(root.left) + [root.val] + inorder_traversal(root.right)
# end

def inorder_traversal(root)
  stack, result = [], []

  node = root
  while node || stack.size > 0
    while node
      stack << node
      node = node.left
    end

    node = stack.pop
    result << node.val
    node = node.right
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_inorder_traversal
    assert_equal(
      [8, 4, 9, 2, 5, 1, 6, 3, 7],
      inorder_traversal(TreeNode.from_a([1, 2, 3, 4, 5, 6, 7, 8, 9]))
    )
  end
end

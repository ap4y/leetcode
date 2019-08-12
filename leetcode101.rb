require 'minitest/autorun'
require './tree_node'

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?
  traverse(root.left, root.right)
end

def traverse(left, right)
  return left == right if left.nil? || right.nil?

  left.val == right.val && traverse(left.left, right.right) &&
    traverse(left.right, right.left)
end

class LeetcodeTest < Minitest::Test
  def test_is_symmetric
    assert(is_symmetric(TreeNode.from_a([1, 2, 2, 3, 4, 4, 3])))
    refute(is_symmetric(TreeNode.from_a([1, 2, 2, nil, 3, nil, 3])))
    assert(is_symmetric(nil))
  end
end

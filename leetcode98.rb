require 'minitest/autorun'
require './tree_node'

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  traverse(root, -Float::MAX, Float::MAX)
end

def traverse(root, min, max)
  return true unless root

  puts "#{root.val}, #{root.left&.val}, #{root.right&.val}, #{min}, #{max}"
  if root.left && (root.left.val >= root.val || root.left.val <= min)
    return false
  end
  if root.right && (root.right.val <= root.val || root.right.val >= max)
    return false
  end

  traverse(root.left, min, root.val) && traverse(root.right, root.val, max)
end

class LeetcodeTest < Minitest::Test
  def test_is_valid_bst
    assert(is_valid_bst(TreeNode.from_a([2, 1, 3])))
    refute(is_valid_bst(TreeNode.from_a([5, 1, 4, nil, nil, 3, 6])))
    assert(is_valid_bst(TreeNode.from_a([10, 5, 15, 1, 9, 11, 20])))
    refute(is_valid_bst(TreeNode.from_a([10, 5, 15, 1, 20, 11, 20])))
    refute(is_valid_bst(TreeNode.from_a([10, 5, 15, 1, 9, 6, 20])))
  end
end

#    10
#   /  \
#  5    15
# / \   / \
#1 [20][6] 20

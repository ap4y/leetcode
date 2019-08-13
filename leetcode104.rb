require 'minitest/autorun'
require './tree_node'

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?
  1 + [max_depth(root.left), max_depth(root.right)].max
end

class LeetcodeTest < Minitest::Test
  def test_max_depth
    assert_equal(3, max_depth(TreeNode.from_a([3, 9, 20, nil, nil, 15, 7])))
    assert_equal(
      4,
      max_depth(TreeNode.from_a([3, 9, 20, nil, nil, 15, 7, 10, 8]))
    )
    assert_equal(1, max_depth(TreeNode.from_a([3])))
    assert_equal(0, max_depth(nil))
  end
end

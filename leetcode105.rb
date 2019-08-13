require 'minitest/autorun'
require './tree_node'

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.size.zero?

  root = TreeNode.new(preorder.first)
  idx = inorder.index(root.val)
  puts "#{preorder}, #{inorder}, #{idx}"
  root.left = build_tree(preorder[1..idx], inorder[0...idx])
  root.right = build_tree(preorder[idx + 1..-1], inorder[idx + 1..-1])
  root
end

class LeetcodeTest < Minitest::Test
  def test_build_tree
    assert_equal(
      [1, 2, 3, 4, 5],
      build_tree([1, 2, 4, 5, 3], [4, 2, 5, 1, 3]).to_a
    )

    assert_equal(
      [3, 9, 20, nil, nil, 15, 7],
      build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7]).to_a
    )
  end
end

# 4 2 5 1 3
# 1 2 4 5 3

# 4 2 5  3
# 2 4 5  3

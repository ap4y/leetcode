class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def self.from_a(arr)
    root = TreeNode.new(arr.shift)
    nodes = [root]
    while arr.size > 0
      node = nodes.shift
      left, right = arr.shift(2)
      if left
        node.left = TreeNode.new(left)
        nodes.push(node.left)
      end

      if right
        node.right = TreeNode.new(right)
        nodes.push(node.right)
      end
    end
    root
  end
end

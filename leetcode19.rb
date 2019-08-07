require 'minitest/autorun'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

  def self.from_a(arr)
    node = ListNode.new(arr.first)
    prev = node
    (1...arr.size).each do |idx|
      n = ListNode.new(arr[idx])
      prev.next = n
      prev = n
    end
    node
  end

  def to_a
    [val] + (self.next&.to_a || [])
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  node = ListNode.new(0)
  node.next = head

  left, right = node, node
  (0...n + 1).each { right = right.next }

  while right
    left = left.next
    right = right.next
  end

  left.next = left.next&.next
  node.next
end

class LeetcodeTest < Minitest::Test
  def test_remove_nth_from_end
    assert_equal(
      [1, 2, 3, 5],
      remove_nth_from_end(ListNode.from_a([1, 2, 3, 4, 5]), 2).to_a
    )

    assert_equal(
      [1, 2, 3, 5],
      remove_nth_from_end(ListNode.from_a([1, 2, 3, 4, 5]), 2).to_a
    )

    assert_equal(
      [1, 2, 3, 4],
      remove_nth_from_end(ListNode.from_a([1, 2, 3, 4, 5]), 1).to_a
    )

    assert_equal(
      [2, 3, 4, 5],
      remove_nth_from_end(ListNode.from_a([1, 2, 3, 4, 5]), 5).to_a
    )

    assert_equal(
      [1, 2, 3, 4, 5],
      remove_nth_from_end(ListNode.from_a([1, 2, 3, 4, 5]), 0).to_a
    )

    assert_equal([], remove_nth_from_end(ListNode.from_a([1]), 1).to_a)
  end
end

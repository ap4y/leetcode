require 'minitest/autorun'
require './list_node'

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

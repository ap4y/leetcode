require 'minitest/autorun'
require './list_node'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  node = ListNode.new(0)
  cur = node
  while l1 || l2
    if (l1 && !l2) || (l1 && l1.val < l2.val)
      cur.next = ListNode.new(l1.val)
      l1 = l1.next
    else
      cur.next = ListNode.new(l2.val)
      l2 = l2.next
    end

    cur = cur.next
  end

  node.next
end

class LeetcodeTest < Minitest::Test
  def test_merge_two_lists
    assert_equal(
      [1, 1, 2, 3, 4, 4],
      merge_two_lists(ListNode.from_a([1, 2, 4]), ListNode.from_a([1, 3, 4]))
        .to_a
    )
    assert_equal(
      [1, 1, 2, 3, 4, 5],
      merge_two_lists(ListNode.from_a([1, 2, 3]), ListNode.from_a([1, 4, 5]))
        .to_a
    )
    assert_equal(
      [1, 1, 2, 3, 4],
      merge_two_lists(ListNode.from_a([1, 2, 3]), ListNode.from_a([1, 4])).to_a
    )
  end
end

require 'minitest/autorun'
require './list_node'

def sum_nodes(ln1, ln2, add)
  sum = (ln1&.val || 0) + (ln2&.val || 0) + add
  node = ListNode.new(sum >= 10 ? sum % 10 : sum)
  if ln1&.next || ln2&.next || sum >= 10
    node.next = sum_nodes(ln1&.next, ln2&.next, sum / 10)
  end
  node
end

def add_two_numbers(l1, l2)
  sum_nodes(l1, l2, 0)
end

class LeetcodeTest < Minitest::Test
  def test_add_two_numbers
    assert_equal(
      [7, 0, 8],
      add_two_numbers(ListNode.from_a([2, 4, 3]), ListNode.from_a([5, 6, 4]))
        .to_a
    )

    assert_equal(
      [7, 0, 8, 5],
      add_two_numbers(ListNode.from_a([2, 4, 3, 5]), ListNode.from_a([5, 6, 4]))
        .to_a
    )

    assert_equal(
      [0, 1],
      add_two_numbers(ListNode.from_a([5]), ListNode.from_a([5])).to_a
    )
  end
end

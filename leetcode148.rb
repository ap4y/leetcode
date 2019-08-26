require 'minitest/autorun'
require './list_node'

# @param {ListNode} head
# @return {ListNode}
# def sort_list(head)
#   return nil if head.nil?

#   min, node, prev = head, head, nil
#   while node&.next
#     if node.next.val < min.val
#       prev = node
#       min = node.next
#     end
#     node = node.next
#   end

#   puts "#{head.to_a}, #{min.val}, #{prev&.val}"
#   min.next =
#     if prev
#       prev.next = min.next
#       sort_list(head)
#     else
#       sort_list(min.next)
#     end
#   min
# end

def sort_list(head)
  stack, node = [], head
  while node
    keep = node.next
    node.next = nil
    stack << node
    node = keep
  end

  stack << merge(*stack.shift(2)) while stack.size > 1
  stack.first
end

def merge(head1, head2)
  puts "#{head1.to_a}, #{head2.to_a}"

  head = ListNode.new(0)
  merged = head

  node1, node2 = head1, head2
  while node1 || node2
    min = nil
    if (node1&.val || Float::MAX) < (node2&.val || Float::MAX)
      min = node1
      node1 = node1.next
    else
      min = node2
      node2 = node2.next
    end

    merged.next = min
    merged = merged.next
  end

  head.next
end

class LeetcodeTest < Minitest::Test
  def test_sort_list
    assert_equal([1, 2, 3, 4], sort_list(ListNode.from_a([4, 2, 1, 3])).to_a)
    assert_equal(
      [-1, 0, 3, 4, 5],
      sort_list(ListNode.from_a([-1, 5, 3, 4, 0])).to_a
    )
    assert_equal([], sort_list(nil).to_a)
  end
end

# 1 4 2 3
# 4, 1, 1

require 'minitest/autorun'
require './list_node'

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  node = ListNode.new(0)
  cur = node
  vals = []
  loop do
    min = Float::MAX
    lists.each_with_index do |ln, idx|
      next unless ln

      slot = 0
      while slot < vals.size
        break if ln.val < vals[slot]
        slot += 1
      end
      vals.insert(slot, ln.val)

      lists[idx] = ln.next
      min = lists[idx].val if lists[idx] && lists[idx].val < min
    end
    puts "#{vals}, #{min}, #{node.to_a}"
    break if vals.size.zero?
    buf = []
    vals.each do |val|
      if val >= min
        buf << val
        next
      end
      cur.next = ListNode.new(val)
      cur = cur.next
    end
    vals = buf
  end
  node.next
end

class LeetcodeTest < Minitest::Test
  def test_merge_k_lists
    assert_equal(
      [1, 1, 3, 4, 4, 5, 6, 7],
      merge_k_lists(
        [
          ListNode.from_a([1, 4, 5]),
          ListNode.from_a([1, 3, 4]),
          ListNode.from_a([6, 7])
        ]
      )
        .to_a
    )
    # assert_equal(
    #   [1, 1, 2, 3, 4, 4, 5, 6],
    #   merge_k_lists(
    #     [
    #       ListNode.from_a([1, 4, 5]),
    #       ListNode.from_a([1, 3, 4]),
    #       ListNode.from_a([2, 6])
    #     ]
    #   )
    #     .to_a
    # )

    # assert_equal([], merge_k_lists([]).to_a)
    # assert_equal(
    #   [1, 1, 2, 3, 4, 4, 5],
    #   merge_k_lists(
    #     [
    #       ListNode.from_a([1, 4, 5]),
    #       ListNode.from_a([1, 3, 4]),
    #       ListNode.new(2)
    #     ]
    #   )
    #     .to_a
    # )
  end
end

require 'minitest/autorun'

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

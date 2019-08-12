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

require 'minitest/autorun'

class MinStack
  def initialize
    @acc, @sorted = [], []
  end

  def push(x)
    @sorted << x if @sorted.size.zero? || x <= @sorted.last
    @acc << x
  end

  def pop
    @sorted.pop if @acc.last == @sorted.last
    @acc.pop
  end

  def top
    @acc.last
  end

  def get_min
    @sorted.last
  end
end

class LeetcodeTest < Minitest::Test
  def test_min_stack
    stack = MinStack.new
    stack.push(-2)
    stack.push(0)
    stack.push(-3)
    assert_equal(-3, stack.get_min)
    stack.pop
    stack.top
    assert_equal(-2, stack.get_min)
  end
end

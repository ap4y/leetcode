require 'minitest/autorun'

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  traverse(Array.new(n + 1) { -1 }, n)
end

def traverse(acc, idx)
  return 0 if idx < 0
  return 1 if idx == 0

  acc[idx] = traverse(acc, idx - 1) + traverse(acc, idx - 2) if acc[idx] == -1
  acc[idx]
end

class LeetcodeTest < Minitest::Test
  def test_climb_stairs
    assert_equal(1, climb_stairs(0))
    assert_equal(2, climb_stairs(2))
    assert_equal(3, climb_stairs(3))
    assert_equal(10_946, climb_stairs(20))
  end
end

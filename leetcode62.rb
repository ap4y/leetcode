require 'minitest/autorun'

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  acc = Array.new(m) { Array.new(n) { 0 } }
  tracert(acc, m - 1, n - 1)
end

def tracert(acc, left, top)
  return 0 if left < 0 || top < 0
  return 1 if left == 0 || top == 0

  if acc[left][top] == 0
    acc[left][top] = tracert(acc, left - 1, top) + tracert(acc, left, top - 1)
  end
  acc[left][top]
end

class LeetcodeTest < Minitest::Test
  def test_unique_paths
    assert_equal(193_536_720, unique_paths(23, 12))
    assert_equal(3, unique_paths(3, 2))
    assert_equal(28, unique_paths(7, 3))
  end
end

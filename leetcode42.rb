require 'minitest/autorun'

# @param {Integer[]} height
# @return {Integer}
def trap(height)
  area = 0
  left, right = 0, height.size - 1
  lmax, rmax = 0, 0

  while left < right
    if height[left] < height[right]
      if height[left] >= lmax
        lmax = height[left]
      else
        area += lmax - height[left]
      end
      left += 1
    else
      if height[right] >= rmax
        rmax = height[right]
      else
        area += rmax - height[right]
      end
      right -= 1
    end
  end
  area
end

class LeetcodeTest < Minitest::Test
  def test_trap
    # assert_equal(2, trap([2, 0, 2]))
    # assert_equal(1, trap([5, 4, 1, 2]))
    # assert_equal(4, trap([1, 0, 4, 2, 3, 0, 2]))
    # assert_equal(3, trap([4, 2, 2, 2, 3]))
    # assert_equal(1, trap([4, 2, 3]))
    # assert_equal(1, trap([3, 2, 4]))
    # assert_equal(0, trap([3, 4, 2]))
    assert_equal(6, trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
    # assert_equal(7, trap([0, 1, 0, 2, 1, 0, 1, 3, 1, 1, 2, 1]))
    # assert_equal(9, trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 3]))
    # assert_equal(7, trap([0, 1, 0, 3, 2, 0, 2, 3, 2, 1, 2, 1]))
    # assert_equal(0, trap([]))
    # assert_equal(0, trap([0]))
    # assert_equal(0, trap([0, 0]))
  end
end

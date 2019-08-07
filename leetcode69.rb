require 'minitest/autorun'

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  left, right = 0, x
  while left <= right
    mid = (left + right) / 2
    if mid * mid < x
      left = mid + 1
    elsif mid * mid > x
      right = mid - 1
    else
      return mid
    end
  end

  right
end
# def my_sqrt(x)
#   sqrt = 0
#   sqrt += 1 until sqrt * sqrt > x
#   sqrt - 1
# end

class LeetcodeTest < Minitest::Test
  def test_my_sqrt
    assert_equal(2, my_sqrt(4))
    assert_equal(2, my_sqrt(8))
    assert_equal(0, my_sqrt(0))
    assert_equal(1, my_sqrt(1))
  end
end

# 0...4: 2
# 0...8 -> 0...3, 2...3, 3...3 -> 2

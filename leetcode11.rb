require 'minitest/autorun'

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  result = 0
  left, right = 0, height.size - 1
  while left < right
    left_num, right_num = height[left], height[right]
    result = [result, [left_num, right_num].min * (right - left)].max

    if left_num < right_num
      left += 1
    else
      right -= 1
    end
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_max_area
    assert_equal(1, max_area([1, 1]))
    assert_equal(49, max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]))
  end
end

require 'minitest/autorun'

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  result, n = 0, heights.size
  left, right = Array.new(n) { 1 }, Array.new(n) { 1 }

  heights.each_with_index do |num, idx|
    left_idx = idx - 1
    left_idx -= left[left_idx] while left_idx >= 0 && heights[left_idx] >= num
    left[idx] = idx - left_idx

    right_idx = idx + 1
    while right_idx < n && heights[right_idx] >= num
      right_idx += right[right_idx]
    end
    right[idx] = right_idx - idx

    area = num * (right_idx - left_idx - 1)
    result = [result, area].max
  end

  puts "#{left}, #{right}"
  result
end

class LeetcodeTest < Minitest::Test
  def test_largest_rectangle_area
    assert_equal(10, largest_rectangle_area([2, 1, 5, 6, 2, 3]))
    assert_equal(18, largest_rectangle_area([2, 1, 5, 6, 2, 3, 10, 9]))
    assert_equal(0, largest_rectangle_area([0]))
    assert_equal(1, largest_rectangle_area([1]))
    assert_equal(0, largest_rectangle_area([]))
    assert_equal(9, largest_rectangle_area([0, 9]))
    assert_equal(9, largest_rectangle_area([0, 9, 0]))
    assert_equal(20, largest_rectangle_area([3, 6, 5, 7, 4, 8, 1, 0]))
  end
end

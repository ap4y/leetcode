require 'minitest/autorun'

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  (row = matrix.shift) ? row + spiral_order(matrix.transpose.reverse) : []
end

class LeetcodeTest < Minitest::Test
  def test_spiral_order
    assert_equal(
      [1, 2, 3, 6, 9, 8, 7, 4, 5],
      spiral_order([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    )

    assert_equal(
      [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7],
      spiral_order([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
    )
  end
end

# 0,0  0,1  0,2  1,2  2,2  2,1  2,0  1,0  1,1
# 0...2 = (3 - 2 - 1)...(3 - 1)
# 2...0 = (3 - 0 - 1)...(3 - 3)

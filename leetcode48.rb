require 'minitest/autorun'

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  midx = matrix.size - 1

  (0...midx).each do |j|
    (j...(midx - j)).each do |i|
      puts "#{j}, #{i}"
      saved = matrix[j][i]
      matrix[j][i] = matrix[midx - i][j]
      matrix[midx - i][j] = matrix[midx - j][midx - i]
      matrix[midx - j][midx - i] = matrix[i][midx - j]
      matrix[i][midx - j] = saved

      matrix.each { |row| puts "#{row}" }
    end
  end
end

class LeetcodeTest < Minitest::Test
  def test_rotate
    m = [[1, 2], [3, 4]]
    rotate(m)
    assert_equal([[3, 1], [4, 2]], m)

    m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    rotate(m)
    assert_equal([[7, 4, 1], [8, 5, 2], [9, 6, 3]], m)

    m = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
    rotate(m)
    assert_equal(
      [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]],
      m
    )

    m = [
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25]
    ]
    rotate(m)
    assert_equal(
      [
        [21, 16, 11, 6, 1],
        [22, 17, 12, 7, 2],
        [23, 18, 13, 8, 3],
        [24, 19, 14, 9, 4],
        [25, 20, 15, 10, 5]
      ],
      m
    )
  end
end

# saved = matrix[1, 1]
# matrix[1, 1] = matrix[3, 1]
# matrix[3, 1] = matrix[3, 3]
# matrix[3, 3] = matrix[1, 3]
# matrix[1, 3] = saved

# saved = matrix[0, 0]
# matrix[0, 0] = matrix[2, 0]
# matrix[2, 0] = matrix[2, 2]
# matrix[2, 2] = matrix[0, 2]
# matrix[0, 2] = saved

# saved = matrix[0, 1]
# matrix[0, 1] = matrix[1, 0]
# matrix[1, 0] = matrix[2, 1]
# matrix[2, 1] = matrix[1, 2]
# matrix[1, 2] = saved

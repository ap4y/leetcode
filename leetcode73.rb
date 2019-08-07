require 'minitest/autorun'
require 'set'

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  return matrix if matrix.size.zero?

  m, n = matrix.size, matrix.first.size
  rows, cols = Set.new, Set.new
  (0...m).each do |i|
    (0...n).each do |j|
      next unless matrix[i][j].zero?
      rows << i
      cols << j
    end
  end

  puts "#{rows}, #{cols}"
  rows.each { |i| (0...n).each { |j| matrix[i][j] = 0 } }
  cols.each { |j| (0...m).each { |i| matrix[i][j] = 0 } }
end

class LeetcodeTest < Minitest::Test
  def test_set_zeroes
    m = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
    set_zeroes(m)
    assert_equal([[1, 0, 1], [0, 0, 0], [1, 0, 1]], m)

    m = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
    set_zeroes(m)
    assert_equal([[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]], m)

    m = [[0, 1, 2, 0], [3, 0, 5, 2], [1, 3, 1, 5]]
    set_zeroes(m)
    assert_equal([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0]], m)
  end
end

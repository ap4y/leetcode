require 'minitest/autorun'

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  return if board.size.zero?

  m, n = board.size, board.first.size
  (0...m).each do |i|
    (0...n).each do |j|
      next unless board[i][j] == 'O'
      checked = {}
      next unless check(board, i, j, m, n, checked)
      checked.each { |(ci, cj), result| board[ci][cj] = 'X' if result }
    end
  end
end

def check(board, i, j, m, n, acc = {})
  return true if board[i][j] == 'X'
  return false if i.zero? || j.zero?
  return false if i == m - 1 || j == n - 1

  key = [i, j]
  return acc[key] if acc[key]

  puts "#{i}, #{j}"
  acc[key] = true
  acc[key] =
    check(board, i - 1, j, m, n, acc) && check(board, i + 1, j, m, n, acc) &&
      check(board, i, j - 1, m, n, acc) &&
      check(board, i, j + 1, m, n, acc)
  acc[key]
end

class LeetcodeTest < Minitest::Test
  def test_two_sum
    board = [%w[X X X X], %w[X O O X], %w[X X O X], %w[X O X X]]
    solve(board)
    assert_equal([%w[X X X X], %w[X X X X], %w[X X X X], %w[X O X X]], board)

    board = [%w[X X X X], %w[X O O X], %w[X O O X], %w[X X X X]]
    solve(board)
    assert_equal([%w[X X X X], %w[X X X X], %w[X X X X], %w[X X X X]], board)

    board = [%w[X X X X], %w[X O O X], %w[X O O X], %w[X O X X]]
    solve(board)
    assert_equal([%w[X X X X], %w[X O O X], %w[X O O X], %w[X O X X]], board)

    board = [%w[X O X O X O], %w[O X O X O X], %w[X O X O X O], %w[O X O X O X]]
    solve(board)
    assert_equal(
      [%w[X O X O X O], %w[O X X X X X], %w[X X X X X O], %w[O X O X O X]],
      board
    )

    board = [
      %w[O X O O O X],
      %w[O O X X X O],
      %w[X X X X X O],
      %w[O O O O X X],
      %w[X X O O X O],
      %w[O O X X X X]
    ]
    solve(board)
    assert_equal(
      [
        %w[O X O O O X],
        %w[O O X X X O],
        %w[X X X X X O],
        %w[O O O O X X],
        %w[X X O O X O],
        %w[O O X X X X]
      ],
      board
    )
  end
end

# X O X O X O
# O X O X O X
# X O X O X O
# O X O X O X

# X O X O X O
# O X X X X X
# X X X X X O
# O X O X O X

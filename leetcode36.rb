require 'minitest/autorun'

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rows = Array.new(9) { {} }
  cols = Array.new(9) { {} }
  boxes = Array.new(9) { {} }
  (0...9).each do |i|
    (i...9).each do |j|
      row_el, col_el = board[i][j], board[j][i]
      row_box = 3 * (i / 3) + (j / 3)
      col_box = 3 * (j / 3) + (i / 3)

      unless row_el == '.'
        return false if rows[i][row_el] || cols[j][row_el]
        return false if boxes[row_box][row_el]

        rows[i][row_el] = true
        cols[j][row_el] = true
        boxes[row_box][row_el] = true
      end

      next if i == j

      unless col_el == '.'
        return false if cols[i][col_el] || rows[j][col_el]
        return false if boxes[col_box][col_el]

        rows[j][col_el] = true
        cols[i][col_el] = true
        boxes[col_box][col_el] = true
      end
    end
  end
  true
end

class LeetcodeTest < Minitest::Test
  def test_is_valid_sudoku
    refute(
      is_valid_sudoku(
        [
          %w[. . . . . . . . .],
          %w[. . . . . 6 . . .],
          %w[. . . . . . . . .],
          %w[. . . . 8 . . . .],
          %w[9 . . . 7 5 . . .],
          %w[. . . . 5 . . 8 .],
          %w[. . 9 . . . . . .],
          %w[2 . 6 . . . . . .],
          %w[. . . . . . . . .]
        ]
      )
    )

    refute(
      is_valid_sudoku(
        [
          %w[. . . 9 . . . . .],
          %w[. . . . . . . . .],
          %w[. . 3 . . . . . 1],
          %w[. . . . . . . . .],
          %w[1 . . . . . 3 . .],
          %w[. . . . 2 . 6 . .],
          %w[. 9 . . . . . 7 .],
          %w[. . . . . . . . .],
          %w[8 . . 8 . . . . .]
        ]
      )
    )

    assert(
      is_valid_sudoku(
        [
          %w[5 3 . . 7 . . . .],
          %w[6 . . 1 9 5 . . .],
          %w[. 9 8 . . . . 6 .],
          %w[8 . . . 6 . . . 3],
          %w[4 . . 8 . 3 . . 1],
          %w[7 . . . 2 . . . 6],
          %w[. 6 . . . . 2 8 .],
          %w[. . . 4 1 9 . . 5],
          %w[. . . . 8 . . 7 9]
        ]
      )
    )

    refute(
      is_valid_sudoku(
        [
          %w[8 3 . . 7 . . . .],
          %w[6 . . 1 9 5 . . .],
          %w[. 9 8 . . . . 6 .],
          %w[8 . . . 6 . . . 3],
          %w[4 . . 8 . 3 . . 1],
          %w[7 . . . 2 . . . 6],
          %w[. 6 . . . . 2 8 .],
          %w[. . . 4 1 9 . . 5],
          %w[. . . . 8 . . 7 9]
        ]
      )
    )

    refute(
      is_valid_sudoku(
        [
          %w[5 3 . . 5 . . . .],
          %w[6 . . 1 9 5 . . .],
          %w[. 9 8 . . . . 6 .],
          %w[8 . . . 6 . . . 3],
          %w[4 . . 8 . 3 . . 1],
          %w[7 . . . 2 . . . 6],
          %w[. 6 . . . . 2 8 .],
          %w[. . . 4 1 9 . . 5],
          %w[. . . . 8 . . 7 9]
        ]
      )
    )

    refute(
      is_valid_sudoku(
        [
          %w[5 3 . . 7 . . . .],
          %w[6 . . 1 9 5 . . .],
          %w[. 9 5 . . . . 6 .],
          %w[8 . . . 6 . . . 3],
          %w[4 . . 8 . 3 . . 1],
          %w[7 . . . 2 . . . 6],
          %w[. 6 . . . . 2 8 .],
          %w[. . . 4 1 9 . . 5],
          %w[. . . . 8 . . 7 9]
        ]
      )
    )
  end
end

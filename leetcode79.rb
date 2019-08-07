require 'minitest/autorun'

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  target = word[0]
  board.each_with_index do |row, i|
    row.each_with_index do |letter, j|
      next unless letter == target
      return true if traverse(board, word, 0, {}, i, j)
    end
  end
  false
end

def traverse(board, word, idx, path, i, j)
  return true if idx == word.length
  return false if i < 0 || j < 0 || i >= board.size || j >= board[i].size
  return false if path[[i, j]]
  return false unless board[i][j] == word[idx]

  path[[i, j]] = true
  result =
    traverse(board, word, idx + 1, path, i + 1, j) ||
      traverse(board, word, idx + 1, path, i - 1, j) ||
      traverse(board, word, idx + 1, path, i, j + 1) ||
      traverse(board, word, idx + 1, path, i, j - 1)
  path[[i, j]] = false
  result
end

class LeetcodeTest < Minitest::Test
  def test_exist
    assert(exist([%w[A B C E], %w[S F E S], %w[A D E E]], 'ABCESEEEFS'))
    assert(exist([%w[C A A], %w[A A A], %w[B C D]], 'AAB'))
    assert(exist([%w[a]], 'a'))
    assert(exist([%w[a b], %w[c d]], 'cdba'))

    board = [%w[A B C E], %w[S F C S], %w[A D E E]]
    assert(exist(board, 'ABCCED'))
    assert(exist(board, 'SEE'))
    refute(exist(board, 'ABCB'))

    board = [%w[a a a a], %w[a a a a], %w[a a a a], %w[a a a a], %w[a a a b]]
    refute(exist(board, 'aaaaaaaaaaaaaaaaaaaa'))
  end
end

# A B C E
# S F E S
# A D E E

require 'minitest/autorun'

def backtrack(acc, n, str = '', left = 0, right = 0)
  if str.length == 2 * n
    acc << str
    return
  end

  backtrack(acc, n, str + '(', left + 1, right) if left < n
  backtrack(acc, n, str + ')', left, right + 1) if right < left
end

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  acc = []
  backtrack(acc, n)
  acc
end

class LeetcodeTest < Minitest::Test
  def test_generate_parenthesis
    assert_equal(%w[()], generate_parenthesis(1))
    assert_equal(%w[(()) ()()], generate_parenthesis(2))
    assert_equal(
      %w[((())) (()()) (())() ()(()) ()()()],
      generate_parenthesis(3)
    )
    assert_equal(
      %w[
        (((())))
        ((()()))
        ((())())
        ((()))()
        (()(()))
        (()()())
        (()())()
        (())(())
        (())()()
        ()((()))
        ()(()())
        ()(())()
        ()()(())
        ()()()()
      ],
      generate_parenthesis(4)
    )
  end
end

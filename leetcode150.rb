require 'minitest/autorun'

# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []
  tokens.each do |token|
    if %w[+ - * /].include?(token)
      op1, op2 = stack.pop(2)
      stack <<
        (token == '/' ? (op1.to_f / op2).to_i : op1.public_send(token, op2))
    else
      stack << token.to_i
    end
    puts "#{token}, #{stack}"
  end
  stack.pop
end

class LeetcodeTest < Minitest::Test
  def test_eval_rpn
    assert_equal(9, eval_rpn(%w[2 1 + 3 *]))
    assert_equal(6, eval_rpn(%w[4 13 5 / +]))
    assert_equal(22, eval_rpn(%w[10 6 9 3 + -11 * / * 17 + 5 +]))
  end
end

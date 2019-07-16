require 'minitest/autorun'

# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1 || s.length <= num_rows

  chars = s.chars
  result = Array.new(num_rows) { '' }

  col = 0
  max_idx = num_rows - 1
  while chars.size > 0
    mod = (col % max_idx)

    if mod != 0
      result[max_idx - mod] << chars.shift
    else
      chars.shift(num_rows).each_with_index { |char, idx| result[idx] << char }
    end

    col += 1
  end

  result.join
end

class LeetcodeTest < Minitest::Test
  def test_convert
    assert_equal('AB', convert('AB', 1))
    assert_equal('ACB', convert('ABC', 2))
    assert_equal('A', convert('A', 1))
    assert_equal('PAYPAL', convert('PAYPAL', 6))
    assert_equal('PINALSIGYAHRPI', convert('PAYPALISHIRING', 4))
    assert_equal('PAHNAPLSIIGYIR', convert('PAYPALISHIRING', 3))
  end
end

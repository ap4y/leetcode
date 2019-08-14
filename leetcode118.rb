require 'minitest/autorun'

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows.zero?

  prev_row, result = [1], [[1]]
  (num_rows - 1).times do
    row =
      (0..prev_row.size).map do |idx|
        sum = 0
        sum += prev_row[idx - 1] if idx > 0
        sum += prev_row[idx] if idx < prev_row.size
        sum
      end
    puts "row: #{row}"
    result << row
    prev_row = row
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_generate
    assert_equal(
      [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]],
      generate(5)
    )

    assert_equal([[1]], generate(1))
    assert_equal([], generate(0))
  end
end

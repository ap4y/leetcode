require 'minitest/autorun'

TABLE = {
  '2' => %w[a b c],
  '3' => %w[d e f],
  '4' => %w[g h i],
  '5' => %w[j k l],
  '6' => %w[m n o],
  '7' => %w[p q r s],
  '8' => %w[t u v],
  '9' => %w[w x y z]
}

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  result = []
  digits.each_char do |num|
    nums = TABLE[num]
    next unless nums
    if result.size == 0
      result = nums
      next
    end
    acc = []
    result.each { |char1| nums.each { |char2| acc << char1 + char2 } }
    result = acc
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_letter_combinations
    assert_equal(%w[ad ae af bd be bf cd ce cf], letter_combinations('23'))
    assert_equal(%w[ad ae af bd be bf cd ce cf], letter_combinations('231'))
    assert_equal(%w[ad ae af bd be bf cd ce cf], letter_combinations('123'))
    assert_equal(
      %w[ap aq ar as bp bq br bs cp cq cr cs],
      letter_combinations('27')
    )
    assert_equal(
      %w[pa pb pc qa qb qc ra rb rc sa sb sc],
      letter_combinations('72')
    )
    assert_equal([], letter_combinations(''))
  end
end

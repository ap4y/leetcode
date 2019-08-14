require 'minitest/autorun'

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  result, min_price = 0, Float::MAX
  prices.each do |price|
    min_price = [min_price, price].min
    result = [result, price - min_price].max
    puts "#{price}, #{min_price}, #{result}"
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_max_profit
    assert_equal(5, max_profit([7, 1, 5, 3, 6, 4]))
    assert_equal(0, max_profit([7, 6, 4, 3, 1]))
    assert_equal(0, max_profit([0]))
    assert_equal(0, max_profit([]))
  end
end

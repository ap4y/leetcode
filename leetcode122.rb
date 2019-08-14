require 'minitest/autorun'

# @param {Integer[]} prices
# @return {Integer}
# def max_profit(prices, acc = {}, offset = 0)
#   return acc[offset] if acc[offset]
#   result, min_price = 0, Float::MAX
#   prices.each_with_index do |price, idx|
#     min_price = [min_price, price].min
#     rest =
#       acc[offset + idx + 1] ||
#         max_profit(prices[idx + 1..-1], acc, offset + idx + 1)
#     result = [result, price - min_price + rest].max
#   end
#   acc[offset] = result
#   result
# end

def max_profit(prices)
  result, idx = 0, 0

  while idx < prices.size
    idx += 1 while idx < prices.size - 1 && prices[idx + 1] <= prices[idx]
    min = prices[idx]
    idx += 1

    idx += 1 while idx < prices.size - 1 && prices[idx + 1] >= prices[idx]
    result += idx < prices.size ? prices[idx] - min : 0
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_max_profit
    assert_equal(7, max_profit([7, 1, 5, 3, 6, 4]))
    assert_equal(4, max_profit([1, 2, 3, 4, 5]))
    assert_equal(0, max_profit([7, 6, 4, 3, 1]))
  end
end

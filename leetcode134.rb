require 'minitest/autorun'

# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
# def can_complete_circuit(gas, cost)
#   (0...gas.size).each { |idx| return idx if can_complete?(gas, cost, idx) }
#   -1
# end

# def can_complete?(gas, cost, start)
#   step, position, amount = 0, start, gas[start]
#   while step <= gas.size
#     return false if amount < cost[position]
#     puts "#{start}: #{position} -> #{amount} - #{cost[position]} "

#     amount -= cost[position]
#     position += 1
#     position = 0 if position == gas.size
#     amount += gas[position]
#     step += 1
#   end
#   true
# end

def can_complete_circuit(gas, cost)
  amount, position, total = 0, 0, 0
  (0...gas.size).each do |idx|
    amount += gas[idx] - cost[idx]
    if amount < 0
      total += amount
      amount = 0
      position = idx + 1
    end
    puts "#{idx}: #{amount}, #{total}, #{position}"
  end

  total += amount
  total < 0 ? -1 : position
end

class LeetcodeTest < Minitest::Test
  def test_can_complete_circuit
    assert_equal(3, can_complete_circuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]))
    assert_equal(-1, can_complete_circuit([2, 3, 4], [3, 4, 3]))
  end
end

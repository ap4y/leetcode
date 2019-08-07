require 'minitest/autorun'

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  acc, add = [], 1
  idx = digits.size - 1
  while idx >= 0
    sum = digits[idx] + add
    if sum >= 10
      acc.unshift(sum % 10)
      add = 1
    else
      acc.unshift(sum)
      add = 0
    end
    idx -= 1
  end
  acc.unshift(add) if add > 0
  acc
end

class LeetcodeTest < Minitest::Test
  def test_plus_one
    assert_equal([1, 2, 4], plus_one([1, 2, 3]))
    assert_equal([4, 3, 2, 2], plus_one([4, 3, 2, 1]))
    assert_equal([1], plus_one([0]))
    assert_equal([1, 0], plus_one([9]))
    assert_equal([1, 0, 0, 0], plus_one([9, 9, 9]))
  end
end

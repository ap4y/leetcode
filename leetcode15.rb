require 'minitest/autorun'

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  sorted = nums.sort
  result = []
  sorted.each_with_index do |num, idx|
    next if idx > 0 && num == sorted[idx - 1]

    left, right = idx + 1, sorted.length - 1

    while left < right
      sum = num + sorted[left] + sorted[right]
      if sum < 0
        left += 1
      elsif sum > 0
        right -= 1
      else
        result << [num, sorted[left], sorted[right]]
        left += 1
        right -= 1

        left += 1 while sorted[left] == sorted[left - 1]
        right -= 1 while sorted[right] == sorted[right + 1]
      end
    end
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_three_sum
    assert_equal([[-1, -1, 2], [-1, 0, 1]], three_sum([-1, 0, 1, 2, -1, -4]))
    assert_equal([[0, 0, 0]], three_sum([0, 0, 0, 0]))
    assert_equal([[0, 0, 0]], three_sum([0] * 12))
    assert_equal([[-1, 0, 1]], three_sum([-1, 0, 1, 0]))
    assert_equal([], three_sum([1, 2, -2, -1]))
    assert_equal([[-2, 0, 2], [-2, 1, 1]], three_sum([-2, 0, 1, 1, 2]))
    assert_equal([], three_sum([0, 0]))
    assert_equal([[0, 0, 0]], three_sum([0] * 3_000))
  end
end

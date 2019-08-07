require 'minitest/autorun'

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  acc = []
  intervals.each do |interval|
    extended = interval
    acc.reject! do |other|
      if intersect?(extended, other)
        extended = [[extended[0], other[0]].min, [extended[1], other[1]].max]
        true
      else
        false
      end
    end
    acc << extended
    puts "#{interval}, #{extended}, #{acc}"
  end
  acc
end

def intersect?(a1, a2)
  return true if a1[0] <= a2[0] && a1[1] >= a2[0]
  return true if a2[0] <= a1[0] && a2[1] >= a1[0]
  false
end

class LeetcodeTest < Minitest::Test
  def test_merge
    assert_equal(
      [[1, 6], [8, 10], [15, 18]],
      merge([[1, 3], [2, 6], [8, 10], [15, 18]])
    )

    assert_equal([[1, 5]], merge([[1, 4], [4, 5]]))

    assert_equal([], merge([]))
    assert_equal([[1, 4]], merge([[1, 4]]))
    assert_equal([[1, 5]], merge([[1, 4], [4, 5]]))
    assert_equal([[0, 4]], merge([[1, 4], [0, 1]]))

    assert_equal([[1, 8]], merge([[1, 4], [6, 8], [3, 7]]))
    assert_equal([[-8, -1]], merge([[-4, -1], [-8, -6], [-7, -3]]))
  end
end

#     x--------x
#     x--------x
#         x--x
#         x--------x
#       x-x
#   x-----x

# x---x x--x x---x
#    x--------x

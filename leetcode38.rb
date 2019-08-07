require 'minitest/autorun'

def next_item(prev)
  item, nums = '', prev.chars
  num, count = nums.shift, 1
  while nums.length > 0
    cur = nums.shift
    if cur == num
      count += 1
    else
      item << "#{count}#{num}"
      num, count = cur, 1
    end
  end
  item << "#{count}#{num}"
end

# @param {Integer} n
# @return {String}
def count_and_say(n)
  return '1' if n == 1
  return '11' if n == 2

  prev, result = '11', ''
  (n - 2).times do
    result = next_item(prev)
    prev = result
  end
  result
end

class LeetcodeTest < Minitest::Test
  def test_count_and_say
    assert_equal('1', count_and_say(1))
    assert_equal('11', count_and_say(2))
    assert_equal('21', count_and_say(3))
    assert_equal('1211', count_and_say(4))
    assert_equal('111221', count_and_say(5))
    assert_equal('312211', count_and_say(6))
    assert_equal('13112221', count_and_say(7))
  end
end

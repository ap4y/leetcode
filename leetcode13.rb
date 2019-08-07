require 'minitest/autorun'

NUMS = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1_000,
  'IV' => 4,
  'IX' => 9,
  'XL' => 40,
  'XC' => 90,
  'CD' => 400,
  'CM' => 900
}

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  chars, sum = s.chars, 0
  while chars.length > 0
    char = chars.shift
    if (char == 'I' || char == 'X' || char == 'C') && chars.size > 0 &&
       (num = NUMS[char + chars[0]])
      chars.shift
      sum += num
      next
    end

    sum += NUMS[char]
  end
  sum
end

class LeetcodeTest < Minitest::Test
  def test_roman_to_int
    assert_equal(3, roman_to_int('III'))
    assert_equal(4, roman_to_int('IV'))
    assert_equal(9, roman_to_int('IX'))
    assert_equal(58, roman_to_int('LVIII'))
    assert_equal(1_994, roman_to_int('MCMXCIV'))
  end
end

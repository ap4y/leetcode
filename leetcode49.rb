require 'minitest/autorun'

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  hash = {}
  strs.each do |str|
    key = str.chars.sort
    hash[key] ||= []
    hash[key] << str
    puts "#{key}, #{hash}"
  end
  hash.values
end

class LeetcodeTest < Minitest::Test
  def test_group_anagrams
    assert_equal(
      [%w[ate eat tea], %w[nat tan], %w[bat]],
      group_anagrams(%w[eat tea tan ate nat bat])
    )
  end
end

require 'minitest/autorun'
require 'set'

# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
# def word_break(s, word_dict)
#   dict = word_dict.each_with_object({}) { |word, acc| acc[word] = true }
#   traverse(s, dict)
# end

# def traverse(s, dict)
#   return true if s.length.zero?

#   idx = 0
#   while idx < s.length
#     unless dict[s[0..idx]]
#       idx += 1
#       next
#     end

#     return true if traverse(s[idx + 1..-1], dict)
#     idx += 1
#   end

#   false
# end

# def word_break(s, word_dict)
#   dict = word_dict.to_set
#   left, right, stack = 0, 0, []
#   while left < s.length
#     puts "#{s[left..right]}, #{stack}"

#     if dict.include?(s[left..right])
#       stack << [left, right]
#       right += 1
#       left = right
#       next
#     end

#     if right == s.length - 1
#       return false if stack.size.zero?
#       left, right = stack.pop
#     end

#     right += 1
#   end

#   true
# end

def word_break(s, word_dict)
  acc = [false] * (s.length + 1)
  acc[0] = true

  (1..s.length).each do |right|
    word_dict.each do |word|
      left = right - word.length
      acc[right] = true if word == s[left...right] && acc[left]
    end
  end
  acc.last
end

class LeetcodeTest < Minitest::Test
  def test_word_break
    assert(word_break('leetcode', %w[leet code]))
    assert(word_break('applepenapple', %w[apple pen]))
    refute(word_break('catsandog', %w[cats dog sand and cat]))
    assert(word_break('catsanddog', %w[cats dog sand and cat]))
  end
end

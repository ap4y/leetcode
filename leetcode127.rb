require 'minitest/autorun'
require 'set'

# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
# def ladder_length(begin_word, end_word, word_list)
#   dict =
#     (word_list + [begin_word]).each_with_object({}) do |word, acc|
#       acc[word] = []
#       word_list.each do |other|
#         next if word == other
#         acc[word] << other if transformable?(word, other)
#       end
#     end

#   puts "#{dict}"
#   return 0 unless dict[end_word]
#   traverse({}, [], dict, begin_word, end_word)
# end

# def traverse(acc, path, dict, from, to)
#   return path.size + 1 if from == to

#   acc[from] ||=
#     dict[from].each_with_object([]) do |jump, results|
#       next if path.include?(jump)
#       path_len = traverse(acc, path + [from], dict, jump, to)
#       results << path_len if path_len > 0
#     end.min ||
#       0

#   acc[from]
# end

def ladder_length(begin_word, end_word, word_list)
  dict =
    (word_list + [begin_word]).each_with_object({}) do |word, acc|
      acc[word] = []
      word_list.each do |other|
        next if word == other
        acc[word] << other if transformable?(word, other)
      end
    end

  puts "#{dict}"
  queue, visited = [[begin_word, 1]], Set.new
  while queue.size > 0
    word, steps = queue.shift
    return steps if word == end_word
    next if visited.include?(word)

    visited << word
    (dict[word] || []).each do |jump|
      queue << [jump, steps + 1] unless visited.include?(jump)
    end
  end
  0
end

def transformable?(from, to)
  diff = 0
  from.chars.each_with_index { |char, idx| diff += 1 if char != to[idx] }
  diff == 1
end

class LeetcodeTest < Minitest::Test
  def test_ladder_length
    assert_equal(5, ladder_length('hit', 'cog', %w[hot dot dog lot log cog]))
    assert_equal(0, ladder_length('hit', 'cog', %w[hot dot dog lot log]))
    assert_equal(
      5,
      ladder_length('hit', 'cog', %w[hot cog dot dog hit lot log])
    )
    assert_equal(
      4,
      ladder_length('red', 'tax', %w[ted tex red tax tad den rex pee])
    )
    assert_equal(2, ladder_length('a', 'c', %w[a b c]))
    assert_equal(0, ladder_length('hot', 'dog', %w[hot dog]))
    assert_equal(
      6,
      ladder_length('leet', 'code', %w[lest leet lose code lode robe lost])
    )
    assert_equal(
      4,
      ladder_length(
        'teach',
        'place',
        %w[
          peale
          wilts
          place
          fetch
          purer
          pooch
          peace
          poach
          berra
          teach
          rheum
          peach
        ]
      )
    )
  end
end

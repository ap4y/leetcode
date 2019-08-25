require 'minitest/autorun'

class LRUCache
=begin
    :type capacity: Integer
=end

  def initialize(capacity)
    @hash = {}
    @capacity = capacity
  end

=begin
    :type key: Integer
    :rtype: Integer
=end

  def get(key)
    value = @hash.delete(key)
    value.nil? ? -1 : @hash[key] = value
  end

=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end

  def put(key, value)
    @hash.delete(key)
    @hash[key] = value
    @hash.shift if @hash.size > @capacity
  end
end

class LeetcodeTest < Minitest::Test
  def test_lru_cache
    cache = LRUCache.new(2)
    cache.put(1, 1)
    cache.put(2, 2)
    assert_equal(1, cache.get(1))

    cache.put(3, 3)
    assert_equal(-1, cache.get(2))

    cache.put(4, 4)
    assert_equal(-1, cache.get(1))
    assert_equal(3, cache.get(3))
    assert_equal(4, cache.get(4))

    cache = LRUCache.new(1)
    cache.put(2, 1)
    assert_equal(-1, cache.get(1))
  end
end

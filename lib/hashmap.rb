
class HashMap
  def initialize(loadfactor=0.8, capacity=16)
    @loadfactor = loadfactor
    @capacity = capacity
    @buckets = []
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
  end
end


class HashMap
  def initialize(loadfactor=0.8, capacity=16)
    @loadfactor = loadfactor
    @capacity = capacity
    @buckets = Array.new(capacity) { Array.new }
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
    puts "[#{key}, #{value}] -> #{index}"

    list = @buckets[index]

    for pair in list
      # Replace value if key exists
      if pair[0] == key
        pair[1] = value
        return
      end
    end
    # Otherwise add a new pair
    list << [key, value]
  end
end

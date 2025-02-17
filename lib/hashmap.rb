
class HashMap
  def initialize(loadfactor=0.8, capacity=16)
    @loadfactor = loadfactor
    @capacity = capacity
    @buckets = Array.new(capacity) { Array.new }
    @size = 0
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
    # puts "[#{key}, #{value}] -> #{index}"

    list = @buckets[index]

    for pair in list
      # Replace value if key exists
      if pair[0] == key
        pair[1] = value
        return
      end
    end
    # Otherwise add a new pair
    @size += 1
    list << [key, value]
    grow if @loadfactor * @capacity < @size
  end

  def grow
    # puts "loadfactor: #{@loadfactor}, capacity: #{@capacity}, length: #{@size}"
    # puts "Increasing to #{@capacity * 2} capacity"
    pairs = []
    for list in @buckets
      for pair in list
        pairs << pair
      end
    end

    @capacity *= 2
    @buckets = Array.new(@capacity) { Array.new }
    @size = 0
    for pair in pairs
      set(pair[0], pair[1])
    end
  end

  def get(key)
    for list in @buckets
      for pair in list
        return pair[1] if pair[0] == key
      end
    end
    nil
  end

  def has?(key)
    get(key).nil? ? false : true
  end
end

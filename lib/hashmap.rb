
class HashMap
attr_reader :length

  def initialize(loadfactor=0.8, capacity=16)
    @loadfactor = loadfactor
    @capacity = capacity
    @buckets = Array.new(capacity) { Array.new }
    @length = 0
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
    @length += 1
    list << [key, value]
    grow if @loadfactor * @capacity < @length
  end

  def grow
    # puts "loadfactor: #{@loadfactor}, capacity: #{@capacity}, length: #{@length}"
    # puts "Increasing to #{@capacity * 2} capacity"
    pairs = []
    for list in @buckets
      for pair in list
        pairs << pair
      end
    end

    clear(@capacity * 2)
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

  def remove(key)
    to_remove = nil
    for list in @buckets
      for pair in list
        to_remove = pair if pair[0] == key
        break
      end
      unless to_remove.nil?
        list.delete(to_remove)
        @length -= 1
        return to_remove[1]
      end
    end
    nil
  end

  def clear(capacity=16)
    @capacity = capacity
    @buckets = Array.new(@capacity) { Array.new }
    @length = 0
  end

  def keys
    keys = []
    for list in @buckets
      for pair in list
        keys << pair[0]
      end
    end
    keys
  end

  def values
    values = []
    for list in @buckets
      for pair in list
        values << pair[1]
      end
    end
    values
  end

  def entries
    pairs = []
    for list in @buckets
      for pair in list
        pairs << pair
      end
    end
    pairs
  end

end

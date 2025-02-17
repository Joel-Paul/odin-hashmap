
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new value
    if @tail.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = node

    @size += 1
  end

  def at(index)
    node = @head
    for _ in 0...index
      node = node.next_node
    end
    node
  end

  def pop
    new_tail = @head
    old_tail = @tail

    if new_tail == old_tail
      @head = nil
    else
      new_tail = at @size - 2
    end

    new_tail.next_node = nil
    @tail = new_tail
    @size -= 1
    old_tail.value
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    index = -1
    until node.nil?
      index += 1
      return index if node.value == value
      node = node.next_node
    end
    nil
  end

  def to_s
    s = ''
    node = @head
    until node.nil?
      s += "( #{node.value} ) -> "
      node = node.next_node
    end
    s + 'nil'
  end

  def insert_at(value, index)
    if index == 0
      prepend value
    elsif index == @size
      append value
    else
      prev_node = at(index - 1)
      node = Node.new(value, prev_node.next_node)
      prev_node.next_node = node
      @size += 1
    end
  end

  def remove_at(index)
    value = @head.value
    if index == 0
      @head = @head.next_node
      @size -= 1
    elsif index == @size - 1
      value = pop
    else
      prev_node = at(index - 1)
      curr_node = prev_node.next_node
      prev_node.next_node = curr_node.next_node
      @size -= 1
      value = curr_node.value
    end
    value
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

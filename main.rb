require_relative 'lib/hashmap'

test = HashMap.new(loadfactor=0.75)

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
# p test.length
p test.keys
p test.values

# p test
test.set('apple', 'blue')
# p test.length
# p test
test.set('lion', 'green')
# p test.length
# p test

test.set('biscuit', 'hard')
# p test.length
# p test

# p test.get('carrot')
# p test.has?('asd')

p test.remove('ice cream')
# p test
# p test.length
# p test.remove('ice cream')
# p test
# p test.length
# test.clear
# p test

p test.keys
p test.values

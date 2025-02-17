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

# p test
test.set('apple', 'blue')
# p test
test.set('lion', 'green')
# p test

test.set('biscuit', 'hard')
# p test

p test.get('carrot')

require_relative "lib/node"
require_relative "lib/binary_search_tree"

# Verify order traversals, height checking, depth checking, and find function
def check_read_functions(binary_tree) 
  puts "Traversals:"
  print "  Level Order: "
  p binary_tree.level_order
  puts ""
  
  print "  Preorder: "
  p binary_tree.preorder
  puts ""
  
  print "  Inorder: "
  p binary_tree.inorder
  puts ""
  
  print "  Postorder: "
  p binary_tree.postorder

  puts ""

  puts "Heights: "
  binary_tree.level_order.each do |i|
    puts "  At ( #{i} ): #{binary_tree.height(binary_tree.find(i))}"
  end

  puts ""

  puts "Depths: "
  binary_tree.level_order.each do |i|
    puts "  At ( #{i} ): #{binary_tree.depth(binary_tree.find(i))}"
  end

  puts ""
  puts ""
end


# Verify tree creation, balanced? check, and read functions
puts "Creating a Binary Search Tree from a random array...".upcase
random_array = Array.new(15) {rand 100}
tree = BinarySearchTree.new(random_array)

puts "The Tree:"
tree.pretty_print
puts ""

puts "Balanced? #{tree.balanced?}"
puts ""

check_read_functions(tree)


# Verify insertion and balanced? check
puts "Inserting elements to unbalance the tree...".upcase
5.times { tree.insert(rand(100..200))}

puts "The Tree (After Insertion):"
tree.pretty_print
puts ""

puts "Balanced? #{tree.balanced?}"
puts ""
puts ""


# Verify rebalancing, balanced? check, and read functions
puts "Rebalancing the tree...".upcase
tree.rebalance

puts "The Tree (After Rebalancing):"
tree.pretty_print
puts ""

puts "Balanced? #{tree.balanced?}"
puts ""

check_read_functions(tree)


# Verify deletion and balanced? check
delete_start = 30
delete_end = 60
puts "Deleting elements (#{delete_start}-#{delete_end}) of the tree...".upcase
delete_start.upto(delete_end) { |i| tree.delete(i) }

puts "The Tree (After Deletion):"
tree.pretty_print
puts ""

puts "Balanced? #{tree.balanced?}"
puts ""
puts ""


# Verify rebalancing, balanced? check, and read functions
puts "Rebalancing the tree...".upcase
tree.rebalance

puts "The Tree (After Rebalancing):"
tree.pretty_print
puts ""

puts "Balanced? #{tree.balanced?}"
puts ""

check_read_functions(tree)
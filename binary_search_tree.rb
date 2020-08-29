Node = Struct.new(:data, :left, :right) do
  include Comparable

  def <=>(other_node)
    data <=> other_node.data
  end
end

class BinarySearchTree

  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.length == 0
    return Node.new(array[0]) if array.length == 1

    tree_array = array.sort.uniq

    start_index = 0
    end_index = tree_array.length - 1
    mid_index = (start_index + end_index) / 2

    left_subarray = mid_index > 0 ? tree_array[0..(mid_index - 1)] : []
    right_subarray = tree_array[(mid_index + 1)..end_index]

    root_node = Node.new(tree_array[mid_index], build_tree(left_subarray), build_tree(right_subarray))
  end

  def find(value)
    pointer = root
    until pointer.nil?
      return pointer if pointer.data == value
      if value < pointer.data
        pointer = pointer.left
      else
        pointer = pointer.right
      end
    end
  end

  def level_order
    level_order_array = []
    node_queue = []
    node_queue.push(root)

    until node_queue.empty? do
      current_node = node_queue.shift
      level_order_array.push(current_node.data)
      node_queue.push(current_node.left) unless current_node.left.nil?
      node_queue.push(current_node.right) unless current_node.right.nil?
    end

    level_order_array
  end

  def preorder(node = @root, array = [])
    array.push(node.data)
    preorder(node.left, array) unless node.left.nil?
    preorder(node.right, array) unless node.right.nil?

    array
  end

  def inorder(node = @root, array = [])
    inorder(node.left, array) unless node.left.nil?
    array.push(node.data)
    inorder(node.right, array) unless node.right.nil?

    array
  end

  def postorder(node = @root, array = [])
    postorder(node.left, array) unless node.left.nil?
    postorder(node.right, array) unless node.right.nil?
    array.push(node.data)

    array
  end

  def height(node)
    return -1 if node.nil?
    
    left_height = height(node.left)
    right_height = height(node.right)

    left_height >= right_height ? left_height + 1 : right_height + 1
  end

  def depth(node)
    pointer = root
    depth_number = 0

    until pointer.nil? || node == pointer
      if node < pointer
        pointer = pointer.left
      else
        pointer = pointer.right
      end
      depth_number += 1
    end

    pointer.nil? ? -1 : depth_number
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    return if root.nil?
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

def random_array(size, limit)
  result = []
  size.times do
    result.push(rand limit)
  end
  result
end

tree = BinarySearchTree.new(random_array(13, 50))
p tree
tree.pretty_print

puts "Level Order: "
p tree.level_order
puts ""

puts "Preorder: "
p tree.preorder
puts ""

puts "Inorder: "
p tree.inorder
puts ""

puts "Postorder: "
p tree.postorder
puts ""

puts "Heights: "
tree.level_order.each do |i|
  puts "Height at ( #{i} ): #{tree.height(tree.find(i))}"
end

puts ""

puts "Depths: "
tree.level_order.each do |i|
  puts "Depth at ( #{i} ): #{tree.depth(tree.find(i))}"
end
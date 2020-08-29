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

  def preorder(node = @root)
    puts "#{node.data}"
    preorder(node.left) unless node.left.nil?
    preorder(node.right) unless node.right.nil?
  end

  def inorder(node = @root)
    inorder(node.left) unless node.left.nil?
    puts "#{node.data}"
    inorder(node.right) unless node.right.nil?
  end

  def postorder(node = @root)
    postorder(node.left) unless node.left.nil?
    postorder(node.right) unless node.right.nil?
    puts "#{node.data}"
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

tree = BinarySearchTree.new(random_array(7, 10))
p tree
tree.pretty_print

puts "Preorder: "
tree.preorder
puts ""

puts "Inorder: "
tree.inorder
puts ""

puts "Postorder: "
tree.postorder
puts ""

puts "Find 3: "
p tree.find(3)
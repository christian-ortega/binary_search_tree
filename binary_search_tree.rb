Node = Struct.new(:data, :left, :right) do
  include Comparable

  def <=>(other_node)
    data <=> other_node.data
  end
end

class BinarySearchTree
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
end
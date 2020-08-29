Node = Struct.new(:data, :left, :right) do
  include Comparable

  def <=>(other_node)
    data <=> other_node.data
  end
end

class BinarySearchTree
  def initialize
    
  end
end
# binary_search_tree
THE ODIN PROJECT: DATA STRUCTURES AND ALGORITHMS

### Binary Search Tree ([View in Repl.it]())
This is an implementation in Ruby of a Binary Search Tree. In the lib folder, the Node structure and Binary Search Tree class are implemented. The main file includes a driver script to verify all the functions of the Binary Search Tree class.

#### Node
The Node structure contains a variable to hold data. This structure also contains references to two other Nodes, which are the Node's left and right children.

#### Binary Search Tree
The Binary Search Tree class converts an array into a tree of nodes by holding a reference to the tree's root node. When initialized, the tree is balanced. The Binary Search Tree class supports proper insertion and deletion of nodes, though this might unbalance the tree. Thus, the Binary Search Tree class has a method to check if the tree is balanced, as well as a method to rebalance the tree. This class also has methods to find a node by value, calculate the height of a node, and calculate the depth of a node. And, the class can also convert the tree into an array based off of four different types of traversals: level order, preorder, inorder, and postorder.
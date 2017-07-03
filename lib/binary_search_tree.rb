require 'pry'
require '../lib/node'

class BinarySearchTree
  def initialize
    @root = nil
  end
  def insert(score, title, depth = 0)
    new_node = Node.new(score, title)
    if @root.nil?
      @root = new_node
      @root.depth
    else
      @root.insert(new_node)
    end
  end
end

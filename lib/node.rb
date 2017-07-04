require 'pry'

class Node
  attr_reader :score, :title, :data
  attr_accessor :left_child, :right_child, :depth
  def initialize(score=nil, title=nil)
    @score = score
    @title = title
    @depth = 0
    @left_child = nil
    @right_child = nil
    @data = { title => score }
  end

  def insert(new_node, depth_counter = 1)
    # check new node score against current node score
    # if new node score is less than current node score
    # and left_child of current node is nil
    if new_node.score < @score && @left_child == nil
      # set left_child = new node
      @left_child = new_node
      return depth_counter
      # if left_child of current node is not nil
    elsif new_node.score < self.score && @left_child != nil
      # call insert on left_child with new node as an argument
      depth_counter += 1
      @left_child.insert(new_node, depth_counter)
    elsif new_node.score > self.score && @right_child == nil
      @right_child = new_node
      return depth_counter
    elsif new_node.score > self.score && @right_child != nil
      depth_counter += 1
      @right_child.insert(new_node, depth_counter)
    end
  end

  def include?(score)
    if score == @score
      true
    elsif score < @score
      if @left_child
        @left_child.include?(score)
      else
        false
      end
    else
      if @right_child
        @right_child.include?(score)
      else
        false
      end
    end
  end

  def depth_of(score)
    return self if @score == score
    if @score > score
      @left_child.depth_of(score)
      @depth = @depth +=1
    else
      @right_child.depth_of(score)
      @depth = @depth +=1
    end
  end

  def max
    if @right_child != nil
      @right_child.max
      return @right_child.data
    end
  end

  def min
    if @left_child != nil
      @left_child.min
      return @left_child.data
    end
  end

  def sort
    [sort_left_child, @data, sort_right_child].flatten.compact
  end

  def sort_left_child
    @left_child.sort unless @left_child.nil?
  end

  def sort_right_child
    @right_child.sort unless @right_child.nil?
  end
end

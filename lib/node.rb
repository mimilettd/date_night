require 'pry'

class Node
  attr_reader :score, :title, :data
  attr_accessor :left_child, :right_child, :depth
  def initialize(score=nil, title=nil, depth = 0)
    @score = score
    @title = title
    @depth = depth
    @left_child = nil
    @right_child = nil
    @data = { title => score }
  end

  def insert(new_node, depth_counter = 0)
    # check new node score against current node score
    # if new node score is less than current node score
    # and left_child of current node is nil
    depth_counter += 1
    if new_node.score < @score && @left_child == nil
      # set left_child = new node
      @left_child = new_node
      # return depth_counter
      # depth_counter += 1
      @left_child.depth = depth_counter
      return @left_child.depth
      # if left_child of current node is not nil
    elsif new_node.score < self.score && @left_child != nil
      # call insert on left_child with new node as an argument
      # depth_counter += 1
      @left_child.insert(new_node, depth_counter)
    elsif new_node.score > self.score && @right_child == nil
      @right_child = new_node
      # depth_counter += 1
      @right_child.depth = depth_counter
      return @right_child.depth
    elsif new_node.score > self.score && @right_child != nil
      # depth_counter += 1
      @right_child.insert(new_node, depth_counter)
    end
  end

  def include?(score, depth_counter = 0)
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
    if score == @score
      return depth
    end
    if score < @score
      @left_child.depth_of(score)
    else
       @right_child.depth_of(score)
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
    if @left_child.nil?
      return
    else
      @left_child.sort
    end
  end

  def sort_right_child
    if @right_child.nil?
      return
    else
      @right_child.sort
    end
  end

  def health(depth)
    # create a counter inside this method
  end
end

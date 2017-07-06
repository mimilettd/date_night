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
    depth_counter += 1
    if new_node.score < @score && @left_child == nil
      @left_child = new_node
      @left_child.depth = depth_counter
      return @left_child.depth
    elsif new_node.score < @score && @left_child != nil
      @left_child.insert(new_node, depth_counter)
    elsif new_node.score > @score && @right_child == nil
      @right_child = new_node
      @right_child.depth = depth_counter
      return @right_child.depth
    elsif new_node.score > @score && @right_child != nil
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

  def sort(sorted_array = [])
    [sort_left_child, @data, sort_right_child].flatten.compact
  end

  def sort_left_child(sorted_array = [])
    if @left_child.nil?
      return
    else
      sorted_array << @left_child.data
      @left_child.sort(sorted_array)
    end
  end

  def sort_right_child(sorted_array = [])
    if @right_child.nil?
      return
    else
      sorted_array << @right_child.data
      @right_child.sort(sorted_array)
    end
  end


  def health(depth)
    health = []
    if depth == @depth
      health << score
      if @left_child != nil
        @left_child.health(depth)
        health << @left_child.count
      end
    end
  end

end

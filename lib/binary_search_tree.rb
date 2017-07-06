require 'pry'
require '../lib/node'

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(score, title)
    new_node = Node.new(score, title)
    if @root.nil?
      @root = new_node
      @root.depth
    else
      @root.insert(new_node)
    end
  end

  def include?(score)
    @root.include?(score)
  end

  def depth_of(score)
    @root.depth_of(score)
  end

  def max
    @root.max
  end

  def min
    @root.min
  end

  def sort
    if @root.nil?
      return
    else
     @root.sort
    end
  end

  def load(file)
    movies = File.readlines(file)
    counter = 0
    movies.each do |movie|
      strip = movie.strip.split(", ")
      counter += 1
      self.insert(strip[0].to_i, strip[1])
    end
    counter
  end

  # def health(depth)
  #   @root.health(depth)
  # end
end

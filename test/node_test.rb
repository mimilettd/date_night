gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'
require 'pry'

class NodeTest < Minitest::Test

  def test_that_class_exist
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_instance_of Node, node
  end

  def test_that_node_has_a_score
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, node.score
  end

  def test_it_can_have_another_score
    node = Node.new(16, "Johnny English")
    assert_equal 16, node.score
  end

  def test_that_node_has_a_title
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal "Bill & Ted's Excellent Adventure", node.title
  end

  def test_that_it_can_have_another_title
    node = Node.new(16, "Johnny English")
    assert_equal "Johnny English", node.title
  end

  def test_that_when_initialized_children_are_nil
    node = Node.new(16, "Johnny English")
    assert_nil node.left_child
    assert_nil node.right_child
  end

  def test_that_when_initialized_depth_is_nil
    node = Node.new(16, "Johnny English")
    assert_equal 0, node.depth
  end

  def test_that_data_is_returned_as_hash
    node = Node.new(16, "Johnny English")
    assert_instance_of Hash, node.data
  end

end

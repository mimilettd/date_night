gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'
require_relative '../lib/node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def test_tree_adds_new_node_and_returns_depth
    tree = BinarySearchTree.new
    assert_equal(0, tree.insert(61, "Bill & Ted's Excellent Adventure"))
    assert_equal(1, tree.insert(16, "Johnny English"))
    assert_equal(1, tree.insert(92, "Sharknado 3"))
    assert_equal(2, tree.insert(50, "Hannibal Buress: Animal Furnace"))
  end
end

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

  def test_tree_verifies_or_rejects_presence_of_score
    tree = BinarySearchTree.new
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(16)
    refute tree.include?(72)
  end

  def test_tree_reports_depth_where_a_score_appears
    tree = BinarySearchTree.new
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal(1, tree.depth_of(92))
    assert_equal(2, tree.depth_of(50))
  end
end

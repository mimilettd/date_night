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

  def test_max_returns_highest_score_in_tree
    tree = BinarySearchTree.new
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal({"Sharknado 3"=>92}, tree.max)
  end

  def test_min_returns_lowest_score_in_tree
    tree = BinarySearchTree.new
    tree.insert(92, "Sharknado 3")
    tree.insert(16, "Johnny English")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal({"Johnny English"=>16}, tree.min)
  end

  def test_sort_returns_an_array_of_data_in_ascending_order
    tree = BinarySearchTree.new
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal([{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50},
    {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}], tree.sort)
  end

  def test_load_where_return_value_is_number_of_movies
    tree = BinarySearchTree.new
    assert_equal(99, tree.load('../lib/movies.txt'))
  end

  def test_health_of_tree
    skip
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    assert_equal([[98, 7, 100]], tree.health(0))
    assert_equal([[58, 6, 85]], tree.health(1))
    assert_equal([[36, 2, 28], [93, 3, 42]], tree.health(2))
  end
end

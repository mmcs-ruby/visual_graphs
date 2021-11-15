require './test/test_helper'

class EqualityTest < Minitest::Test
  include VisualGraphs

  def test_test
    hash_graph = {1 => [2], 2 => [4]}
    graph = Graph.adjacency_list_init(hash_graph)

    hash_graph1 = {1 => [2], 2 => [1]}
    graph1 = Graph.adjacency_list_init(hash_graph1)

    assert_equal false, graph == graph1

  end

  def test_test_test
    hash_graph3 = Graph.adjacency_list_init({1 => [2], 2 => [3], 3 => [1]})
    hash_graph4 = Graph.adjacency_list_init({2 => [3], 3 => [1], 1 => [2]})
    hash_graph5 = Graph.adjacency_list_init({5 => [3], 7 => [5], 2 => [1]})

    assert_equal true,  hash_graph3 === hash_graph4
    assert_equal false, hash_graph5 === hash_graph4
  end

  def test_eql
    hash_graph6 = Graph.adjacency_list_init({1 => [2], 2 => [3], 3 => [1]})
    hash_graph7 = Graph.adjacency_list_init({2 => [3], 3 => [1], 1 => [2]})
    hash_graph8 = Graph.adjacency_list_init({5 => [3], 7 => [5], 2 => [1]})

    assert_equal true,  hash_graph6.eql?(hash_graph7)
    assert_equal false, hash_graph7.eql?(hash_graph8)
  end

  def test_equal
    hash_graph9 =  Graph.adjacency_list_init({1 => [2], 2 => [3], 3 => [1]})
    hash_graph10 = Graph.adjacency_list_init({2 => [3], 3 => [1], 1 => [2]})
    hash_graph11 = Graph.adjacency_list_init({5 => [3], 7 => [5], 2 => [1]})

    assert_equal true,  hash_graph9.equal?(hash_graph10)
    assert_equal false, hash_graph9.equal?(hash_graph11)
  end

end
require 'minitest/autorun'
require './test/test_helper'
require './lib/visual_graphs/weighted_graph'

class WeightedGraphTest < Minitest::Test
  include VisualGraphs
  def setup
    @filepath = 'test/resources/test_weighted_graph.json'
  end

  def test_correct_json_init_edges
    graph = WeightedGraph.load_from_json(@filepath)
    assert_equal [[1, [2, 3]], [2, [3, 4]], [3, [1, 5]]], graph.edges, 'edges do not match'
  end

  def test_json_init_vertices
    graph = WeightedGraph.load_from_json(@filepath)
    assert_equal [1, 2, 3], graph.vertices, 'vertices do not match'
  end

  def test_correct_hash_init_edges
    hash_graph = {1 => [[2, 3]], 2 => [[1, 4]]}
    graph = WeightedGraph.adjacency_list_init(hash_graph)
    assert_equal [[1, [2, 3]], [2, [1, 4]]], graph.edges, 'edges do not match'
  end

  def test_hash_init_vertices
    hash_graph = {1 => [[2, 3]], 2 => [[1, 4]]}
    graph = WeightedGraph.adjacency_list_init(hash_graph)
    assert_equal [1, 2], graph.vertices, 'edges do not match'
  end

  def test_correct_edge_insertion
    graph = WeightedGraph.adjacency_list_init({})
    graph.insert_edge([1, [2, 3]])
    assert_equal [[1, [2, 3]]], graph.edges,  'edges do not match'
  end

  def test_raise_exp_wrong_list
    assert_raises WrongParamsForWeightedGraphInit do
      WeightedGraph.adjacency_list_init({1 => [2]})
    end

  end

  def test_raise_error_wrong_json
    assert_raises WrongParamsForWeightedGraphInit do
      WeightedGraph.load_from_json('test/resources/test_data.json')
    end
  end

  def test_empty_hash_init
    graph = WeightedGraph.adjacency_list_init({})
    assert_equal 0, graph.edges.length, 'incorrect empty hash init'
  end

  def test_wrong_edge_wont_insert
    graph = WeightedGraph.adjacency_list_init({})
    assert_equal false, graph.insert_edge([1, 2]), 'wrong edge was inserted'
  end

  def test_vertex_will_be_inserted
    graph = WeightedGraph.adjacency_list_init({})
    graph.insert_vertex(2)
    assert_equal 1, graph.vertices.count(2), 'vertex was not added'
  end


end
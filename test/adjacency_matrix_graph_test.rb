# frozen_string_literal: true

require './test/test_helper'
require 'json'
require './lib/visual_graphs/adjacency_matrix_graph'

class AdjMatrixGraphTest < Minitest::Test
  include VisualGraphs

  def setup
    @input_graph_path = 'test/resources/adjacency_matrix_graph.json'
    @output_graph_path = 'test/resources/output_graph.json'
    File.open(@output_graph_path, 'w') { |f| f.truncate(0) } if File.exist? @output_graph_path
  end

  def test_json_methods_convert_graph_correctly
    graph = AdjMatrixGraph.new
    graph.load_from_json(@input_graph_path)
    graph.dump_to_json(@output_graph_path)
    input = JSON.load File.open(@input_graph_path)
    output = JSON.load File.open(@output_graph_path)
    assert_equal input, output, "Output json is different from input json"
  end

  def test_load_from_array_method_raises_exceptions_with_correct_messages
    graph = AdjMatrixGraph.new

    obj = { 2 => 3, str: 9 }
    exception = assert_raises(AdjacencyMatrixError) { graph.load_from_array(obj) }
    assert_equal 'Adjacency matrix should have Array type', exception.message

    obj = [2, [1, 2], { value: 8 }, (1..3)]
    exception = assert_raises(AdjacencyMatrixError) { graph.load_from_array(obj) }
    assert_equal 'Array`s elements must be arrays', exception.message

    obj = [[1, 2, 3], [4, 5, 6]]
    exception = assert_raises(AdjacencyMatrixError) { graph.load_from_array(obj) }
    assert_equal 'Inner arrays should have same length as outer array', exception.message

    obj = [[2, -1], [-9, 0]]
    exception = assert_raises(AdjacencyMatrixError) { graph.load_from_array(obj) }
    assert_equal 'Values of matrix should not be negative', exception.message
  end

  def test_vertices_are_created_correctly
    graph = AdjMatrixGraph.new

    graph.load_from_array([[2, 3], [0, 1]])
    graph_vertices = graph.vertices
    vertices_array = [0, 1]
    assert_equal vertices_array, graph_vertices

    graph.load_from_json(@input_graph_path)
    graph_vertices = graph.vertices
    vertices_array = [0, 1, 2]
    assert_equal vertices_array, graph_vertices
  end

  def test_edges_are_created_correctly
    graph = AdjMatrixGraph.new

    graph.load_from_array([[2, 3], [0, 1]])
    graph_edges = graph.edges
    edges_array = [[[0, 0], 2],
                   [[0, 1], 3],
                   [[1, 1], 1]]
    assert_equal edges_array, graph_edges

    graph.load_from_json(@input_graph_path)
    graph_edges = graph.edges
    edges_array = [[[0, 1], 2],
                   [[0, 2], 1],
                   [[1, 0], 3],
                   [[1, 2], 5],
                   [[2, 0], 6],
                   [[2, 1], 4]]
    assert_equal edges_array, graph_edges
  end

  def test_add_vertex_method
    graph = AdjMatrixGraph.new
    graph.load_from_array([[1, 2], [3, 4]])

    exception = assert_raises(InappropriateChangeOfAdjacencyMatrix) { graph.add_vertex(2.16) }
    assert_equal 'Vertex should be Integer', exception.message

    exception = assert_raises(InappropriateChangeOfAdjacencyMatrix) { graph.add_vertex(-7) }
    assert_equal 'The vertex should not be negative', exception.message

    exception = assert_raises(InappropriateChangeOfAdjacencyMatrix) { graph.add_vertex(1) }
    assert_equal 'The vertex already exists', exception.message

    exception = assert_raises(InappropriateChangeOfAdjacencyMatrix) { graph.add_vertex(5) }
    assert_equal 'Vertices should go without gaps', exception.message

    graph.add_vertex(2)
    assert_equal 3, graph.vertices.length
    assert_equal 3, graph.adjacency_matrix.length
  end

  def test_add_edge_method
    graph = AdjMatrixGraph.new
    graph.load_from_array([[1, 2], [3, 4]])

    exception = assert_raises(InappropriateChangeOfAdjacencyMatrix) { graph.add_edge(0, 1, -5) }
    assert_equal 'Weight can`t be negative', exception.message

    graph.add_edge(1, 0, 9)
    assert_equal 2, graph.vertices.length
    assert_equal 2, graph.adjacency_matrix.length
    assert_equal 9, graph.adjacency_matrix[1][0]
    assert(graph.edges.include?([[1, 0], 9]))

    graph.add_edge(2, 1, 6)
    assert_equal 3, graph.vertices.length
    assert_equal 3, graph.adjacency_matrix.length
    assert_equal 6, graph.adjacency_matrix[2][1]
    assert(graph.edges.include?([[2, 1], 6]))
  end

  def test_string_representation
    graph = AdjMatrixGraph.new
    graph.load_from_array([[5]])
    assert_equal "Adjacency matrix:\n5  \n", graph.to_s
    graph.load_from_array([[23, 2], [3, 48]])
    assert_equal "Adjacency matrix:\n23 2  \n3  48 \n", graph.to_s
  end

end

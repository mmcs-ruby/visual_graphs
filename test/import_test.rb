# frozen_string_literal: true

require "./test/test_helper"

class ImportGraphTest < Minitest::Test
  include VisualGraphs
  def setup
    @filepath = 'test/resources/test_data.json'
  end

  def test_json_import_vertices_size
    graph = Graph.new(@filepath)
    assert_equal 3, graph.vertices.size, 'vertices size do not match'
  end

  def test_json_import_edges_size
    graph = Graph.new(@filepath)
    assert_equal 3, graph.edges.size, 'edges size do not match'
  end

end
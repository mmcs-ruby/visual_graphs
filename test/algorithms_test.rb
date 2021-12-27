require 'minitest/autorun'
require './lib/visual_graphs/algorithms'
require './lib/visual_graphs/weighted_graph'

module VisualGraphs
  class AlgorithmsTest < Minitest::Test
    def setup
      @filepath = 'test/resources/test_weighted_graph.json'
    end


    def basic_test
      graph = WeightedGraph.load_from_json(@filepath)
      dist = Algorithms.dijkstra(graph, 0)
      assert_equal [0, 3, 5], dist, 'wrong dist'
    end
  end
end
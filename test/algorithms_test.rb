require 'minitest/autorun'
require './lib/visual_graphs/algorithms'
require './lib/visual_graphs/weighted_graph'

module VisualGraphs
  class AlgorithmsTest < Minitest::Test
    def setup
      @filepathToWeighted = 'test/resources/test_weighted_graph.json'
      @filepath = 'test/resources/test_data.json'
    end


    def basic_test_Dijkstra
      graph = WeightedGraph.load_from_json(@filepathToWeighted)
      dist = Algorithms.dijkstra(graph, "1")
      assert_equal [0, 3, 5], dist, 'wrong dist'
    end

    def wrong_graph_Dijkstra
      assert_raises WrongParamsForAlgorithm do
        graph = Graph.load_from_json(@filepath)
        Algorithms.dijkstra(graph, "1")
      end

      assert_raises WrongParamsForAlgorithm do
        graph = WeightedGraph.load_from_json(@filepathToWeighted)
        Algorithms.dijkstra(graph, "120")
      end
    end
  end
end
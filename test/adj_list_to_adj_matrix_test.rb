require './test/test_helper'


class AdjacencyListToMatrixTest < Minitest::Test
  include VisualGraphs

  def adj_list_to_matrix_test
    graphList = Graph.adjacency_list_init({1 => [2],2 => [1]})
    graphMatrix = graphList.to_adj_matrix_graph
    assert_equal "Adjacency matrix:\n0  1  \n1  0  \n", graphMatrix.to_s
  end

end

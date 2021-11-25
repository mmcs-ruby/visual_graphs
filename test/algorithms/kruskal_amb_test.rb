require 'minitest/autorun'
require "visual_graphs"
#Test for Kruskal's algorithm for adjacency matrix based graph
class Kruskal_ambTest < Minitest::Test
  include VisualGraphs
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test1
    matrix =
      [
        [0, 7, 8, -1, -1,-1],
        [7, 0, 11, 2, -1, -1],
        [8, 11, 0, 6, 9, -1],
        [-1, 2, 6, 0, 11, 9],
        [-1, -1, 9, 11, 0, 10],
        [-1, -1, -1, 9, 10, 0]
      ]
    expected =
    [
      [0,7,-1,-1,-1,-1],
      [7,0,-1,2,-1,-1],
      [-1,-1,0,6,9,-1],
      [-1,2,6,0,-1,9],
      [-1,-1,9,-1,0,-1],
      [-1,-1,-1,9,-1,0]
    ]
    result = kruskal matrix
    assert_equal result, expected
  end

  def test2
    matrix =
    [
      [0,2,-1,6,-1],
      [2,0,3,8,5],
      [-1,3,0,-1,7],
      [6,8,-1,0,9],
      [-1,5,7,9,0]
    ]
    expected =
    [
      [0,2,-1,6,-1],
      [2,0,3,-1,5],
      [-1,3,0,-1,-1],
      [6,-1,-1,0,-1],
      [-1,5,-1,-1,0],
    ]
    result = kruskal matrix
    assert_equal result, expected
  end

end
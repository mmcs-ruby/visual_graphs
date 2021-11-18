# frozen_string_literal: true

require "./test/test_helper"
require './lib/visual_graphs/algorithms'
require './lib/visual_graphs/adjacency_matrix_graph'

class AlgorithmTest < Minitest::Test
  include VisualGraphs

  def test_exists_matrix_DFS_method
      assert Algorithms.methods.size > 0
  end

  def test_matrix_DFS_does_not_accept_invalid_data
    alg = Algorithms.new

    exception = assert_raises AdjacencyMatrixError do
      my_print = lambda { |n| print(n ) }
      alg.matrix_DFS(5, my_print)
    end
    assert_equal 'argument must be of AdjMatrixGraph type', exception.message

    exception = assert_raises AdjacencyMatrixError do
      my_print = lambda { |n| print(n ) }
      alg.matrix_DFS([1, 2, 3], my_print)
    end
    assert_equal 'argument must be of AdjMatrixGraph type', exception.message

    exception = assert_raises AdjacencyMatrixError do
      my_print = lambda { |n| print(n ) }
      alg.matrix_DFS("it's joke", my_print)
    end
    assert_equal 'argument must be of AdjMatrixGraph type', exception.message
  end

  def test_matrix_DFS_correct_work_size2
    alg = Algorithms.new

    matrix = AdjMatrixGraph.new
    matrixSrc = [[2, 3], [0, 1]]
    matrix.load_from_array(matrixSrc)

    traversed_vertices = []
    traverse = lambda { |n| traversed_vertices.append(n) }
    alg.matrix_DFS(matrix, traverse)

    assert_equal traversed_vertices, [0, 1]
  end


  def test_matrix_DFS_correct_work_size5
    alg = Algorithms.new

    matrix = AdjMatrixGraph.new
    matrixSrc = [[0, 1, 1, 0, 0],
                 [0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 1],
                 [0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0]]
    matrix.load_from_array(matrixSrc)

    traversed_vertices = []
    traverse = lambda { |n| traversed_vertices.append(n) }
    alg.matrix_DFS(matrix, traverse)

    assert_equal traversed_vertices, [0, 1, 2, 3, 4]
  end

  def test_matrix_DFS_correct_work_size3
    alg = Algorithms.new

    matrix = AdjMatrixGraph.new
    matrixSrc = [[0, 0, 2],
                 [2, 0, 0],
                 [0, 2, 0]]
    matrix.load_from_array(matrixSrc)

    traversed_vertices = []
    traverse = lambda { |n| traversed_vertices.append(n) }

    alg.matrix_DFS(matrix, traverse)

    assert_equal traversed_vertices, [0, 2, 1]
  end
end
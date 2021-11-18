# frozen_string_literal: true

module VisualGraphs
  # class with different algorithms for graphs
  class Algorithms

    # Depth-First Search, (for adjacency matrix based graph)
    def matrix_DFS(graph_matrix, vertexAction)

      msg = 'argument must be of AdjMatrixGraph type'
      raise AdjacencyMatrixError, msg unless graph_matrix.is_a?(AdjMatrixGraph)

      matrix = graph_matrix.adjacency_matrix
      initial_index = 0

      visited = []
      node_stack = [initial_index]
      loop do
        curr_node = node_stack.shift

        visited.append(curr_node)
        return false if curr_node == nil
        return true if curr_node == matrix.length

        vertexAction.call(curr_node)

        children = (0..matrix.length-1).to_a.select do |i|
          # do not process loops
          next if curr_node == i
          next if visited.find{|v| v == i} != nil

          matrix[curr_node][i] != 0
        end

        node_stack = node_stack + children
      end
    end
  end
end


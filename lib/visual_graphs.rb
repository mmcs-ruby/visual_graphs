# frozen_string_literal: true

require_relative "visual_graphs/version"
require_relative "visual_graphs/graph"
require_relative 'visual_graphs/algorithms/Kruskal'
require_relative 'visual_graphs/adjacency_matrix_graph'

module VisualGraphs
  class Error < StandardError; end

  class InvalidJSONFileNameError < RuntimeError; end

  class IncorrectArgumentsForGraphInit < StandardError; end

  # error for wrong parameters  in weighted graph initialization
  class WrongParamsForWeightedGraphInit < StandardError; end

  # error which occurs in case of accessing non-existent files
  class FileDoesNotExist < StandardError; end

  # errors connected with defining of adjacency matrix
  class AdjacencyMatrixError < StandardError
    def initialize(msg = '', exception_type = '')
      @exception_type = exception_type
      super(msg)
    end
  end

  # errors connected with inappropriate changes to an adjacency matrix
  class InappropriateChangeOfAdjacencyMatrix < StandardError
    def initialize(msg = '', exception_type = '')
      @exception_type = exception_type
      super(msg)
    end
  end

end

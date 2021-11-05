# frozen_string_literal: true

require_relative "visual_graphs/version"
require_relative "visual_graphs/graph"
module VisualGraphs
  class Error < StandardError; end
  
  class InvalidJSONFileNameError < RuntimeError; end

  class IncorrectArgumentsForGraphInit < StandardError;end
  # error for wrong parameters  in weighted graph initialization
  class WrongParamsForWeightedGraphInit< StandardError;end
  
end

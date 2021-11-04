# frozen_string_literal: true

require_relative "visual_graphs/version"
require_relative "visual_graphs/graph"
module VisualGraphs
  class Error < StandardError; end

  class InvalidJSONFileNameError < RuntimeError; end

end

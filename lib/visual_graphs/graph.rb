# frozen_string_literal: true

require 'json'

module VisualGraphs
  class Graph
    def initialize(path)
      file = File.open(path)
      @adjacency_list = {}
      @edges = []
      temp = JSON.load(file)
      temp.each do |k, v|
        temp_k = k.to_i
        @adjacency_list[temp_k] = v
        v.each { |adj_vertex| @edges << [temp_k, adj_vertex] }
      end
    end

    def vertices()
      @adjacency_list.keys
    end

    def edges()
      @edges
    end
  end
end
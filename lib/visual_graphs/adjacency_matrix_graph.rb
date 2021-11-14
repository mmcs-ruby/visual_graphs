# frozen_string_literal: true

require 'json'

module VisualGraphs

  # class of graph based on adjacency matrix
  class AdjMatrixGraph
    attr_accessor :adjacency_matrix, :vertices, :edges

    # Default constructor for AdjMatrixGraph class
    def initialise
      @adjacency_matrix = []
      @vertices = []
      @edges = []
    end

    # Supporting method that checks whether the object is adjacency matrix
    def check_adjacency_matrix(obj)
      msg = 'Adjacency matrix should have Array type'
      raise AdjacencyMatrixError, msg unless obj.instance_of?(Array)

      msg1 = 'Array`s elements must be arrays'
      msg2 = 'Inner arrays should have same length as outer array'
      msg3 = 'Values of matrix should not be negative'
      obj.each do |x|
        raise AdjacencyMatrixError, msg1 unless x.instance_of?(Array)
        raise AdjacencyMatrixError, msg2 unless obj.length == x.length
        raise AdjacencyMatrixError, msg3 unless x.all? { |elem| elem >= 0 }
      end
    end

    # Supporting method that gets an array of edges from an adjacency matrix
    def get_edges_from_matrix(mat)
      edges_array = []
      (0...mat.length).each do |i|
        (0...mat.length).each do |j|
          edges_array << [[i, j], mat[i][j]] unless (mat[i][j]).zero?
        end
      end
      edges_array
    end

    # Loads graph based on adjacency matrix from JSON-file
    def load_from_json(path_to_file)
      raise FileDoesNotExist unless File.exist? path_to_file

      obj = JSON.load File.open(path_to_file)
      check_adjacency_matrix(obj)
      @adjacency_matrix = obj
      @vertices = (0...obj.length).to_a
      @edges = get_edges_from_matrix(obj)
    end

    # Unloads graph based on adjacency matrix into JSON-file
    def dump_to_json(path_to_file)
      File.open(path_to_file, 'w') { |f| f.write(@adjacency_matrix.to_json) }
    end

    # Loads graph based on adjacency matrix from object of Array type
    def load_from_array(obj)
      check_adjacency_matrix(obj)
      @adjacency_matrix = obj
      @vertices = (0...obj.length).to_a
      @edges = get_edges_from_matrix(obj)
    end

    # Supporting method that checks whether the input object can be a vertex
    def check_vertex(vertex)
      msg = 'Vertex should be Integer'
      raise InappropriateChangeOfAdjacencyMatrix, msg unless vertex.instance_of?(Integer)

      msg = 'The vertex should not be negative'
      raise InappropriateChangeOfAdjacencyMatrix, msg if vertex.negative?

      msg = 'Vertices should go without gaps'
      raise InappropriateChangeOfAdjacencyMatrix, msg if vertex > @vertices.length
    end

    # Supporting method that adds a vertex to graph without checking the vertex
    def add_vertex_after_check
      mat = @adjacency_matrix
      mat.each do |row|
        row << 0
      end
      new_row = Array.new(vertices.length + 1, 0)
      mat << new_row
      @adjacency_matrix = mat
      @vertices << @vertices.length
    end

    # Adds a vertex to the graph
    def add_vertex(vertex)
      check_vertex(vertex)
      msg = 'The vertex already exists'
      raise InappropriateChangeOfAdjacencyMatrix, msg if vertex < @vertices.length
      add_vertex_after_check
    end

    # Adds an edge to the graph
    def add_edge(vertex1, vertex2, weight)
      check_vertex(vertex1)
      check_vertex(vertex2)
      msg = 'Weight can`t be negative'
      raise InappropriateChangeOfAdjacencyMatrix, msg if weight.negative?

      add_vertex_after_check if vertex1 == @vertices.length
      add_vertex_after_check if vertex2 == @vertices.length
      if weight.positive?
        @adjacency_matrix[vertex1][vertex2] = weight
        @edges = get_edges_from_matrix(@adjacency_matrix)
      end
    end

    # Returns string representation of graph as an adjacency matrix
    def to_s
      result = "Adjacency matrix:\n"
      @adjacency_matrix.each do |row|
        new_line = (row.map { |x| "%-3s" % x }).join
        result += "#{new_line}\n"
      end
      result
    end

  end
end

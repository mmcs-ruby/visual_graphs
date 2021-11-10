require_relative 'graph'

module  VisualGraphs
  class WeightedGraph < VisualGraphs::Graph
    def initialize()
      super()
    end

     def self.load_from_json(path)
       graph = Graph.load_from_json(path)
       weighted_graph = WeightedGraph.new
       weighted_graph.edges = graph.edges
       weighted_graph.adjacency_list = graph.adjacency_list
       graph_is_weighted?(graph.edges)
       weighted_graph
     end

    def self.adjacency_list_init(list)
      graph = Graph.adjacency_list_init(list)
      weighted_graph = WeightedGraph.new
      weighted_graph.edges = graph.edges
      weighted_graph.adjacency_list = graph.adjacency_list
      graph_is_weighted?(graph.edges)
      weighted_graph
    end

    #check that all edges are: [v1, [v2,w]]
    # v1,v2 - vertices , w - weight
    def self.graph_is_weighted?(edges)
      edges.each do |edge|
        unless correct_edge?(edge)
          raise WrongParamsForWeightedGraphInit
        end
      end
    end

    def self.correct_edge?(edge)
      edge[1].is_a? Array and edge[1].length == 2
    end

    def insert_edge(edge)
      if (WeightedGraph.correct_edge? edge) && !(@edges.include? edge)
        insert_vertex(edge[0])
        insert_vertex(edge[1][0])
        @adjacency_list[edge[0]] << edge[1]
        @edges << edge
        return true
        end
      false
    end

  end
  
end
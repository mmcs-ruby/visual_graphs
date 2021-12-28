require_relative 'weighted_graph'

module  VisualGraphs
  #Algorihtms class for Visual Graph
  class Algorithms

    INF = 1000000000

    def init
      #infinity value
    end


    def check_graph_for_dijkstra(wh_gr, start)

      #Check class of input value
      unless wh_gr.is_a?(WeightedGraph) or all_weight_positive(wh_gr)
        raise WrongParamsForAlgorithm
      end

      unless wh_gr.adjacency_list.has_key?(start)
        raise WrongParamsForAlgorithm
      end

    end

    def all_weight_positive(wh_gr)
      wh_gr.edges.each{ |t|
        t.each do
          if t.is_a? Array and t.length == 2 and t[1] <= 0
            return false
          end
        end
      }
      true
    end

    #Dijkstra alg
    # return distance from spec vertex for others
    def dijkstra(wh_gr, start)

      check_graph_for_dijkstra(wh_gr, start)

      #Convert to hash
      number_of_element = wh_gr.adjacency_list.length
      dist = Hash.new(INF)
      flags = Hash.new(false)

      dist[start] = 0

      number_of_element.times do
        v = find_uncheck_min(wh_gr, flags, dist)

        flags[v] = true

        wh_gr.adjacency_list[v].each{ |g|
          if dist[v] + g[1] < dist[g[0]]
            dist[g[0]] = dist[v] + g[1]
          end
        }
      end
      dist

    end

    def find_uncheck_min(wh_gr, flags, dist)
      v = "-1"
      wh_gr.vertices.each { |j|
        if not flags[j] and (v == -1 or dist[j] < dist[v])
          v = j
        end
      }
      v
    end

  end
end



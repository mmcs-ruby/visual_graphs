require_relative 'weighted_graph'

module  VisualGraphs
  #Algorihtms class for Visual Graph
  class Algorithms

    def init
      #infinity value
      @inf = 1000000000
    end


    def check_graph_for_dijkstra(wh_gr, start)

      #Check class of input value
      unless wh_gr.is_a?(WeightedGraph) or all_weight_positive(wh_gr)
        raise WrongParamsForAlgorithm
      end

      if start < 0 or start > wh_gr.length
        raise WrongParamsForAlgorithm
      end

    end

    def all_weight_positive(wh_gr)
      wh_gr[v].each do |t|
        if t.last <= 0
          return false
        end
      end
      true
    end

    #Dijkstra alg
    # return distance from spec vertex for others
    # start vertex nums from 0
    def dijkstra(wh_gr, start)

      check_graph_for_dijkstra(wh_gr, start)

      number_of_element = wh_gr.adjacency_list.length
      dist = Array.new(number_of_element, @inf)
      flags = Array.new(number_of_element, false)

      dist[start] = 0

      number_of_element.times do
        v = find_uncheck_min(number_of_element, flags, dist)

        flags[v] = true

        #problem with no 0,1,2... graph
        #!Need to fix logic
        wh_gr.to_a[v].each_with_index { |g, index|

          if dist[v] + g[1][1] < dist[g[1][0]]
            dist[g[1][0]] = dist[v] + g[1][1]
          end
        }
      end
      dist

    end

    def find_uncheck_min(number_of_element, flags, dist)
      v = -1
      [0..number_of_element-1].each { |j|
        if not flags[j] and (v == -1 or dist[j] < dist[v])
          v = j
        end
      }
      v
    end

  end
end



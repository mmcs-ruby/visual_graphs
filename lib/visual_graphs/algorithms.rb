require_relative 'weighted_graph'

module  VisualGraphs
  #Algorihtms class for Visual Graph
  class Algorithms
    #Dijkstra alg
    # return distance from spec vertex for others
    # start vertex nums from 0
    #
    def check_graph_for_dijkstra(wh_gr, start)

      #Check class of input value
      unless wh_gr.is_a?(WeightedGraph)
        raise WrongParamsForAlgorithm
      end

      if start < 0 or start > wh_gr.length
        raise WrongParamsForAlgorithm
      end
      wh_gr[v].each do |t|
        if t.last <= 0
          raise WrongParamsForAlgorithm
        end
      end

    end

    def dijkstra(wh_gr, start)

      #infinity value
      inf = 1000000000
      check_graph_for_dijkstra(wh_gr, start)

      number_of_element = wh_gr.adjacency_list.length
      dist = Array.new(number_of_element,inf)
      u = Array.new(number_of_element, false)

      dist[start] = 0

      number_of_element.times do
        v = -1
        [0..number_of_element].each { |j|
          if not u[j] and (v == -1 or d[j] < d[v])
            v = j
          end
        }

        u[v] = true

        wh_gr[v].each_with_index { |g, index|
          to = index
          len = g.last

          if dist[v] + len < dist[to]
            dist[to] = dist[v] + len
          end
        }
      end
      dist

    end

  end
end



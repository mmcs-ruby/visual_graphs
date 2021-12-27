require_relative 'weighted_graph'

module  VisualGraphs
  #Algorihtms class for Visual Graph
  class Algorithms
    #Dijkstra alg
    # return distance from spec vertex for others
    # start vertex nums from 0
    def dijkstra(wh_gr, start)

      #infinity value
      inf = 1000000000
      #Check class of input value
      wh_gr.is_a?(WeightedGraph)

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



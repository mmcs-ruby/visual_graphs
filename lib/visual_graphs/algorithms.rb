require_relative 'weighted_graph'

module  VisualGraphs
  #Algorihtms class for Visual Graph
  class Algorithms
    #Dijkstra alg
    # return distance from spec vertex for others
    def dijkstra(wh_gr, start)

      #infinity value
      inf = 1000000000

      #Check class of input value
      wh_gr.is_a?(WeightedGraph)

      n = wh_gr.adjacency_list.length
      dist = Array.new(n,inf)
      u = Array.new(n, false)

      dist[start] = 0

      n.times do
        v = -1
        [0..n].each { |j|
          if not u[j] and (v == -1 or d[j] < d[v])
            v = j
          end
        }

        if d[v] == inf
          break
        end

        u[v] = true

        wh_gr[v].each { |g|
          to = g.first
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



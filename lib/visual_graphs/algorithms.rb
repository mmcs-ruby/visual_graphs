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
      d = Array.new(n,inf)
      u = Array.new(n, false)

      d[start] = 0

      n.times do
        v = -1
        for j in [0..n] do
          if not u[j] and (v == -1 or d[j] < d[v])
            v = j
          end
        end

        if d[v] == inf
          break
        end

        u[v] = true

        for g in  wh_gr[v] do
          to = g.first
          len = g.last

          if d[v] + len < d[to]
            d[to] = d[v] + len
          end
        end
      end

      d

    end

  end
end



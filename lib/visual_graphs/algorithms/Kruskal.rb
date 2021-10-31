require 'matrix'

class Kruskal_Helper
  attr_reader :parent, :result

  def initialize(size)
    @parent = Array.new(size) {|i| i}
    @result = Array.new(size) { |i| Array.new(size) { |j| i == j ? 0 : -1} } # временная замена, т.к. нет нужного класса
  end


  def find(i)
    while i != @parent[i]
      i = @parent[i]
    end
    return i
  end

  def union(i, j, w)
    a = find(i)
    b = find(j)
    @parent[a] = b
    addEdge(i,j,w)
  end

  def addEdge(first, second, weight)
    @result[first][second] = weight
    @result[second][first] = weight
  end

  def result
    return @result
  end
end

def kruskal(matrix)
  exists = lambda do |weight|
    weight > 0
  end

  # следующие три строки честно взяты из интернета, я их не понимаю
  n_bytes = [42].pack('i').size
  n_bits = n_bytes * 16
  max_integer = 2 ** (n_bits - 2) - 1

  sz = matrix[0].size
  helper = Kruskal_Helper.new sz

  (0...matrix.size - 1).each {
    min = max_integer
    a = -1
    b = -1

    (0...sz).each do |i|
      (0...sz).each do |j|
        way = matrix[i][j]
        if exists.call(way)
          if helper.find(i) != helper.find(j) and way < min
            min = way
            a = i
            b = j
          end
        end
      end
    end

    helper.union a, b, min
  }

  #p matrix
  #p helper.result
  helper.result
end

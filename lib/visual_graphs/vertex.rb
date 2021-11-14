module VisualGraphs
  class Vertex
    attr_accessor :name
    attr_accessor :value
    attr_accessor :color

    def initialize(params = {})
      @name = params.fetch(:name, "")
      @value = params.fetch(:value)
      @color = params.fetch(:color, "black")
    end

    def name
      @name
    end

    def name=(name)
      @name = name
    end

    def output_to_standard_stream()
      puts "Vertex name: #{name}, value: #{value}, color: #{color}"
    end

  end
end
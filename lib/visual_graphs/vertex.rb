module VisualGraphs
  class Vertex
    private
    attr_accessor :name
    public
    attr_accessor :value
    attr_accessor :color

    public
    def initialize(params = {})
      check_argument_is_a_numeric(params.fetch(:value))
      check_argument_is_a_string(params.fetch(:name, ""))
      check_argument_is_a_string(params.fetch(:color, "black"))
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

    def print_to_output
      puts "Vertex name: #{name}, value: #{value}, color: #{color}"
    end

    private
    def check_argument_is_a_numeric(arg)
      raise TypeError, "Invalid type of argument (Must be Numeric)" unless arg.is_a?(Numeric)
    end
    def check_argument_is_a_string(arg)
      raise TypeError, "Invalid type of argument (Must be String)" unless arg.is_a?(String)
    end
  end
end
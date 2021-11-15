# frozen_string_literal: true

module VisualGraphs

  class Vertex

    def initialize(params = {})
      @name = params.fetch(:name, "")
      @value = params.fetch(:value, 0)
      @color = params.fetch(:color, "black")
      @key = params.fetch(:key, 0)
    end

    def name
      @name
    end

    def name=(name)
      check_argument_is_a_string(name)
      @name = name
    end

    def value
      @value
    end

    def value=(value)
      check_argument_is_a_numeric(value)
      @value = value
    end

    def color
      @color
    end

    def color=(color)
      check_argument_is_a_string(color)
      @color = color
    end

    def key
      @key
    end

    def key=(key)
      check_argument_is_a_numeric(key)
      @key = key
    end

    def print_to_output
      puts "Vertex name: #{name}, value: #{value}, color: #{color}"
    end

    def >=(other)
      @key >= other.key
    end

    def <=(other)
      @key <= other.key
    end

    def <(other)
      @key < other.key
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
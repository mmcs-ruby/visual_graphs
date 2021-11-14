require 'minitest/autorun'
require './test/test_helper'
require './lib/visual_graphs/vertex'

class VertexTestTest < Minitest::Test
  include VisualGraphs

  def setup

  end

  def test_vertex_init
    v1 = Vertex.new(:name => "name", :value => 10, :color => "red")

    assert_equal v1.name, "name", "name isn't matching"
    assert_equal v1.value, 10, "value isn't matching"
    assert_equal v1.color, "red", "color isn't matching"
  end
end
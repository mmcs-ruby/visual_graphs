require 'minitest/autorun'
require './test/test_helper'
require './lib/visual_graphs/vertex'

class VertexTestTest < Minitest::Test
  include VisualGraphs

  def test_vertex_init
    v1 = Vertex.new(name: 'name', value: 10, color: 'red')

    assert_equal v1.name, 'name', "name isn't matching"
    assert_equal v1.value, 10, "value isn't matching"
    assert_equal v1.color, 'red', "color isn't matching"
  end

  def test_vertex_default_init
    v2 = Vertex.new(value: -1)
    assert_equal v2.name, '', "name isn't matching"
    assert_equal v2.value, -1, "value isn't matching"
    assert_equal v2.color, 'black', "color isn't matching"
  end

  def test_vertex_setter
    v1 = Vertex.new(name: 'name', value: 10, color: 'red')
    v1.name = 'newname'
    assert_equal v1.name, 'newname', "name isn't matching"
  end

  def test_to_s
    v1 = Vertex.new(name: 'name', value: 10, color: 'red')
    assert_equal v1.to_s, 'Vertex <key: 0 value: 10 color: red name: name>'
    assert_equal v1.to_str, 'Vertex <key: 0 value: 10 color: red name: name>'
  end

  def test_name_set
    assert_raises TypeError do
      v1 = Vertex.new(name: 'name', value: 10, color: 'red')
      v1.name = 666
    end
  end

  def test_value_set
    v1 = Vertex.new(name: 'name', value: 10, color: 'red')
    v1.value = 666
    assert_raises TypeError do
      v1.value = '666'
    end
  end

  def test_color_set
    v1 = Vertex.new(name: 'name', value: 10, color: 'red')
    v1.color = '666'
    assert_raises TypeError do
      v1.color = 666
    end
  end

  def test_key_set
    v1 = Vertex.new(name: 'name', value: 10, color: 'red')
    v1.key = 666
    assert_raises TypeError do
      v1.key = 'newname'
    end
  end

  def test_vertex_less
    v1 = Vertex.new(key: 1, name: 'name', value: 10, color: 'red')
    v2 = Vertex.new(key: 2, name: 'name', value: 10, color: 'red')
    assert_operator v1, :<, v2
  end

  def test_vertex_above_equal
    v1 = Vertex.new(key: 1, name: 'name', value: 10, color: 'red')
    v2 = Vertex.new(key: 2, name: 'name', value: 10, color: 'red')
    assert_operator v2, :>=, v1
  end

  def test_vertex_less_equal
    v1 = Vertex.new(key: 1, name: 'name', value: 10, color: 'red')
    v2 = Vertex.new(key: 1, name: 'name', value: 10, color: 'red')
    assert_operator v1, :<=, v2
  end
end

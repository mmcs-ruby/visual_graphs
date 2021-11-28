require './test/test_helper'
require 'json'

class AdjacencyListGraphTest < Minitest::Test
  include VisualGraphs

  def setup
    @filepath = 'test/resources/test_data.json'
    @output_file_path = 'test/resources/output_test_data.json'
    File.delete @output_file_path if File.exist? @output_file_path
  end

  def test_json_file_created_when_graph_was_dumped_to_json
    graph = Graph.load_from_json(@filepath)
    graph.dump_to_json(@output_file_path)
    assert_equal true, File.exist?(@output_file_path), 'json file was not created'
  end

  def test_dumped_graph_in_json_file_is_correct
      graph = Graph.load_from_json(@filepath)
      graph.dump_to_json(@output_file_path)

      init_file = File.open(@filepath)
      dumped_file = File.open(@output_file_path)
      initial_graph_json = JSON.load(init_file)
      dumped_graph_json = JSON.load(dumped_file)
      init_file.close
      dumped_file.close
      assert_equal initial_graph_json, dumped_graph_json, 'dump_to_json is not working'

  end

  def test_incorrect_json_file_name_raise_exception
    assert_raises InvalidJSONFileNameError do
      graph = Graph.load_from_json(@filepath)
      graph.dump_to_json('test/incorrect')
    end
  end

  def test_correct_vertices_adjacency_list_initialization
    hash_graph = Graph.adjacency_list_init({1 => [2], 2 => [3], 3 => [1]})
    assert_equal [1, 2, 3], hash_graph.vertices, 'vertices arrays do not match'
  end

  def test_correct_edges_adjacency_list_initialization
    hash_graph = Graph.adjacency_list_init({1 => [2], 2 => [3], 3 => [1]})
    assert_equal [[1, 2], [2, 3], [3, 1]], hash_graph.edges, 'edges arrays do not match'
  end

  def test_adding_edge_will_add_edge_to_adjacency_list
    graph = Graph.load_from_json(@filepath)
    graph.insert_edge([1, 5])
    assert_equal true, graph.instance_variable_get(:@adjacency_list)[1].include?(5), 'vertex was not added to adjacency_list'
  end

  def test_existing_edge_will_not_be_inserted
    graph = Graph.load_from_json(@filepath)
    graph.insert_edge([1, 2])
    assert_equal 1, graph.edges.count([1, 2])
  end


  def test_non_existent_edge_will_be_inserted
    graph = Graph.load_from_json(@filepath)
    graph.insert_edge([1,4])
    assert_equal true, graph.edges.include?([1, 4]), 'new edge was not added'
  end

  def test_existing_vertice_will_not_be_inserted
    graph = Graph.load_from_json(@filepath)
    graph.insert_vertex(1)
    assert_equal 1, graph.vertices.count(1), 'existing vertex has been added twice'
  end

  def test_non_existing_vertice_will_be_inserted
    graph = Graph.load_from_json(@filepath)
    graph.insert_vertex(10)
    assert_equal true,graph.vertices.include?(10), 'vertex was not added'
  end

  def test_non_existent_vertice_will_be_added_while_inserting_edge
    graph = Graph.load_from_json(@filepath)
    graph.insert_edge([1,4])
    assert_equal true, graph.vertices.include?(4), 'new vertex was not added during edge inserting'
  end

  def test_loop_edge_will_be_added
    graph = Graph.load_from_json(@filepath)
    graph.insert_edge([1, 1])
    assert_equal true, graph.edges.include?([1, 1]), 'looped edge was not added'
  end

  def test_loop_edge_will_not_add_same_vertex_twice
    graph = Graph.load_from_json(@filepath)
    graph.insert_edge([4, 4])
    assert_equal 1, graph.vertices.count(4), 'more than 1 vertex was added during looped-edge inserting'
  end

  def test_each_for_edges_array
    graph = Graph.load_from_json(@filepath)
    test_arr=[]
    graph.each { |x| test_arr.append(x) }
    assert_equal [[1,2], [2, 3], [3, 1]], test_arr
    test_arr.clear
    graph.insert_edge([1,4])
    graph.each { |x| test_arr.append(x) }
    assert_equal [[1,2], [2, 3], [3, 1],[1, 4]], test_arr
    test_arr.clear
    graph.insert_edge([3,2])
    graph.each { |x| test_arr.append(x) }
    assert_equal [[1,2], [2, 3], [3, 1],[1, 4], [3, 2]],test_arr
  end

  def test_each_with_index_for_edges_array
    graph = Graph.load_from_json(@filepath)
    test_arr=[]
    graph.each_with_index{ |x, i| test_arr.append(x, i)}
    assert_equal [[1, 2], 0, [2, 3], 1, [3, 1], 2],test_arr
    test_arr.clear
    graph.insert_edge([4, 4])
    graph.each_with_index { |x,i| test_arr.append(x, i)}
    assert_equal [[1, 2], 0, [2, 3], 1, [3, 1], 2, [4, 4], 3], test_arr
    test_arr.clear
    graph.insert_edge([1,4])
    graph.insert_edge([2,5])
    graph.each_with_index { |x, i| test_arr.append(x, i)}
    assert_equal [[1, 2], 0, [2, 3], 1, [3, 1], 2, [4, 4], 3, [1, 4], 4, [2, 5], 5], test_arr
    test_arr.clear
    graph.insert_edge([3,5])
    graph.each_with_index { |x, i| test_arr.append(x, i)}
    assert_equal [[1, 2], 0, [2, 3], 1, [3, 1], 2, [4, 4], 3, [1, 4], 4, [2, 5], 5, [3, 5], 6], test_arr



  end

end

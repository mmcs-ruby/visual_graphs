require "./test/test_helper"
require 'json'

class AdjacencyListGraphTest < Minitest::Test
  include VisualGraphs

  def setup
    @filepath = 'test/resources/test_data.json'
    @output_file_path = 'test/resources/output_test_data.json'
    #if File.exists? @output_file_path
    #  File.delete @output_file_path
    #end
  end

  def test_json_file_created_when_graph_was_dumped_to_json
    graph = Graph.new(@filepath)
    graph.dump_to_json(@output_file_path)
    assert_equal true, File.exists?(@output_file_path), "json file was not created"
  end

  def test_dumped_graph_in_json_file_is_correct
      graph = Graph.new(@filepath)
      graph.dump_to_json(@output_file_path)

      init_file = File.open(@filepath)
      dumped_file = File.open(@output_file_path)
      initial_graph_json = JSON.load(init_file)
      dumped_graph_json = JSON.load(dumped_file)
      init_file.close
      dumped_file.close
      assert_equal initial_graph_json, dumped_graph_json, "dump_to_json is not working"

  end

  def test_incorrect_json_file_name_raise_exception
    assert_raises InvalidJSONFileNameError do
      graph = Graph.new(@filepath)
      graph.dump_to_json('test/incorrect')
    end
  end


  def test_existing_edge_will_not_be_inserted
    graph = Graph.new(@filepath)
    graph.insert_edge([1,2])
    assert_equal 1, graph.edges.count([1,2])
  end

  #def test_non_existent_edge_will_be_inserted

  #end

  #def test_existing_vertice_will_not_be_inserted

  #end

  #def test_existing_vertice_will_not_be_inserted

  #end

  #def test_non_existent_vertice_will_be_added_while_inserting_edge

  #end

  #def test_existent_vertice_will_not_be_added_while_inserting_edge

  #end

end
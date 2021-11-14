require 'minitest/autorun'
require './test/test_helper'
require './lib/visual_graphs/min_heap'

class MinHeapTest < Minitest::Test
  include VisualGraphs

  # initialization tests

  def test_count_empty_heap_is_null
    min_heap = MinHeap.new
    assert_equal 0, min_heap.count
  end

  def test_peek_min_in_empty_is_nil
    min_heap = MinHeap.new
    assert_nil min_heap.peek_min
  end

  # min heap ordering on insert

  def test_order_of_single_elements_is_preserved
    min_heap = MinHeap.new
    vert = Vertex.new
    min_heap << vert
    assert_equal 1, min_heap.count
    assert_equal vert, min_heap.peek_min
  end

  def test_order_of_two_elements_is_preserved
    min_heap = MinHeap.new
    vert1 = Vertex.new(key: 1)
    vert2 = Vertex.new(key: 2)
    min_heap << vert1
    min_heap << vert2
    assert_equal 2, min_heap.count
    assert_equal vert1, min_heap.peek_min
  end

  def test_ordering_of_two_elements_reverse_is_preserved
    min_heap = MinHeap.new
    vert1 = Vertex.new(key: 1)
    vert2 = Vertex.new(key: 2)
    min_heap << vert2
    min_heap << vert1
    assert_equal 2, min_heap.count
    assert_equal vert1, min_heap.peek_min
  end

  def test_ordering_of_three_elements_is_preserved
    min_heap = MinHeap.new
    vert1 = Vertex.new(key: 1)
    vert2 = Vertex.new(key: 2)
    vert3 = Vertex.new(key: 3)
    min_heap << vert3
    min_heap << vert1
    min_heap << vert2
    assert_equal 3, min_heap.count
    assert_equal vert1, min_heap.peek_min
  end

  # extract min

  def test_ordering_after_extract_min_is_preserved
    min_heap = MinHeap.new
    (1..10).each do |i|
      min_heap << Vertex.new(key: i)
    end

    assert_equal 1, min_heap.peek_min.key
    assert_equal 10, min_heap.count

    vert = min_heap.extract_min
    assert_equal 1, vert.key
    assert_equal 9, min_heap.count
  end

  def test_insert_reverse_ordering_after_extract_min_is_preserved
    min_heap = MinHeap.new
    (1..10).each do |i|
      min_heap << Vertex.new(key: 11 - i)
    end

    assert_equal 1, min_heap.peek_min.key
    assert_equal 10, min_heap.count

    vert = min_heap.extract_min
    assert_equal 1, vert.key
    assert_equal 9, min_heap.count
  end

  def test_insert_random_ordering_after_extract_min_is_preserved
    min_heap = MinHeap.new

    test_elements = [7, 5, 8, 12, 6]

    test_elements.each do |element|
      min_heap << Vertex.new(key: element)
    end

    assert_equal 5, min_heap.peek_min.key
    assert_equal 5, min_heap.count

    elements_after_insertion = [5, 6, 8, 12, 7]

    min_heap.elements.each_with_index do |element, index|
      assert_equal element.key, elements_after_insertion[index]
    end

    vert = min_heap.extract_min
    assert_equal 5, vert.key
    assert_equal 4, min_heap.count

    elements_after_remove_min = [6, 7, 8, 12]

    min_heap.elements.each_with_index do |element, index|
      assert_equal element.key, elements_after_remove_min[index]
    end
  end

  # delete element

  def test_ordering_after_delete_element_is_preserved
    min_heap = MinHeap.new

    test_elements = [7, 5, 8, 12, 6]

    test_elements.each do |element|
      min_heap << Vertex.new(key: element)
    end

    assert_equal 5, min_heap.count
    assert_equal 5, min_heap.peek_min.key

    vert_to_delete = Vertex.new(key: 12)
    vert = min_heap.delete_element(vert_to_delete)
    assert_equal 12, vert.key
    assert_equal 4, min_heap.count

    elements_after_deletion = [5, 6, 8, 7] # remove '12'

    min_heap.elements.each_with_index do |element, index|
      assert_equal element.key, elements_after_deletion[index]
    end
  end



end


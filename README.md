[![Build](https://github.com/mmcs-ruby/visual_graphs/actions/workflows/main.yml/badge.svg)](https://github.com/mmcs-ruby/josephjoguts/visual_graphs/workflows/main.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/48549da79ca45b3cc525/maintainability)](https://codeclimate.com/github/mmcs-ruby/visual_graphs/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/48549da79ca45b3cc525/test_coverage)](https://codeclimate.com/github/mmcs-ruby/visual_graphs/test_coverage)

# VisualGraphs

## Usage

```ruby
#simple not weighted graph
# json import
graph = Graph.load_from_json(path)

#initialization from hash
hash_graph = {1 => [2, 3], 2 => [1, 4]}
graph = Graph.adjacency_list_init(hash_graph)

graph.vertices #return list of vertices
graph.edges #return list of edges
```
```ruby
#USAGE of Vertex Class
# initialization:
vertex = Vertex.new(:name => "name", :value => 10, :color => "black")
# default name is empty string (""), default color is "black"
```
```ruby
# print Vertex info to output:
puts `vertex = #{vertex}`
# it will be formatted like:
# "vertex = Vertex <key: 0 value: 10 color: red name: name>"

```
```ruby
#adding new vertex (vertex could be numbers,chars .etc)
# if vertex is already exists it will not be added
graph.insert_vertex(new_vertex)
```
```ruby
#adding new edge for simple Graph
# vertices will also be included in vertices list of graph if they are not there
# also add second_vertex to adjacency_list of first_vertex 
graph.insert_edge([first_vertex, second_vertex])
```
```ruby
graph.output_to_standard_stream # prints graph(adjacency_list)
```
```ruby
#will create(overwrite) json_file and save adjacency_list in it
#json_file name must ends with .json 
graph.dump_to_json(path_to_file)
```

```ruby
WeightedGraph - weighted_adjacency_list

# json import
# will raise error if 
graph = WeightedGraph.load_from_json(path)

#initialization from hash
hash_graph = {1 => [[2, 3]], 2 => [[1, 4]]}
graph = WeightedGraph.adjacency_list_init(hash_graph)

graph.vertices #return list of vertices
graph.edges #return list of edges

#v1,v2 vertices,w - weight
graph.insert_edge([v1,[v2,w]])
```

```ruby

MinHeap - min_heap
# used for implementation of Prim's algorithm

# initializes empty heap
min_heap = MinHeap.new

# insertion of new vertex
min_heap << Vertex.new(key: 2, value: 3)

# delete heap element with key of elem_to_delete
elem_to_delete = Vertex.new(key: 12)
deleted = min_heap.delete_element(elem_to_delete)

# count amount of actual elements in heap
cnt = min_heap.count

# get the minimum key from the heap
vert = min_heap.peek_min

# iteration of heap elements
min_heap.elements.each_with_index do |element, index|
  puts "#{index} element: #{element}"
end

# return the actual elements and re-heapify the minheap
vert = min_heap.extract_min

# check if heap contains element
min_heap.contains_element(element)

# print heap element.to_s for each heap element line by line
min_heap.print_heap

# Graph based on adjacency matrix

# creating a graph using default constructor
graph = AdjMatrixGraph.new

# loading a graph from JSON-file
graph.load_from_json(path)

# unloading a graph into JSON-file
graph.dump_to_json(path)

# loading a graph from an object of Array type
object = [[2, 1], [3, 4]] # adjacency matrix as Array object
graph.load_from_array(object)

# getting arrays of vertices and edges from graph
graph.vertices
graph.edges

# adding vertices and edges to the graph
graph.add_vertex(8)
graph.add_edge(3, 5, 4) # edge from vertex 3 to vertex 5 with weight 4

# prints a graph to console in a nice way
puts graph
```

## Data formats

```
for simple not weighted Graph class
{
  "1":[2],
  "2":[3],
  "3":[1,4]
  "4": []
}

hash = {1 => [2,3]}

for weightedGraph 
{
  "1":[[2,1]],
  "2":[[3,4]],
  "3":[[1,5],[4,6]]
  "4": []
}

hash = {1 => [[2,3], [3,4]]}

```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'visual_graphs'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install visual_graphs

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/visual_graphs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/visual_graphs/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the VisualGraphs project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/visual_graphs/blob/master/CODE_OF_CONDUCT.md).

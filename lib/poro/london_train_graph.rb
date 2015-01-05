require 'rgl/adjacency'
require 'rgl/dijkstra'
require 'rgl/traversal'

class LondonTrainGraph
  TIMED_EDGE_TRAVERSAL = 3.minutes
  TIMED_LINE_TRAVERSAL = 12.minutes
  attr_reader :graph, :wheighted_edges

  def initialize
    @graph = RGL::AdjacencyGraph[]
    @wheighted_edges = {}
    @routes_hash = {}

    self.load
    self
  end

  def load
    lines = Line.includes(:previous_station, :next_station).all
    lines.each do |line|
      previous_station = line.previous_station
      next_station = line.next_station

      @graph.add_edge(previous_station, next_station)
      @wheighted_edges[[previous_station, next_station]] = line.id
      @routes_hash[[previous_station, next_station]] = line.line
    end

  end

  def find_path(source, target)
    raise "Not Implemented Yet"
  end

  def find_shortest_path(source, target)
    begin
      @graph.dijkstra_shortest_path(@wheighted_edges, source, target)
    rescue Exception => e
      return []
    end
  end

  def shortest_path_time(source, target)
    stations = self.find_shortest_path(source, target)
    edge_start = 0
    edge_end = 1
    time = 0
    previous_line = 0

    while edge_end < stations.length
      prev_station = stations[edge_start]
      next_station = stations[edge_end]

      current_line = @routes_hash[[prev_station, next_station]]
      if current_line != previous_line && previous_line != 0
        time += TIMED_LINE_TRAVERSAL
      else
        time += TIMED_EDGE_TRAVERSAL
      end

      previous_line = current_line
      edge_start += 1
      edge_end += 1
    end

    time.seconds
  end
end

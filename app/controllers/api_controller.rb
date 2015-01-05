class ApiController < ApplicationController
  respond_to :xml, :json
  before_filter :process_graph

  def path
    respond_with @graph.find_path(@start_station, @end_station)
  end

  def shortest_path
    respond_with @graph.find_shortest_path(@start_station, @end_station)
  end

  def shortest_path_with_time
    respond_with @graph.shortest_path_time(@start_station, @end_station)
  end

  private
    def process_graph
      @graph = LondonTrainGraph.new
      @start_station = Station.find(params[:start_station])
      @end_station = Station.find(params[:end_station])
    end
end

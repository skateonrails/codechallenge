require 'rails_helper'

RSpec.describe LondonTrainGraph do
  before :all do
    @graph = LondonTrainGraph.new
  end

  describe '.find_path' do
    pending "Not Implemented Yet"
  end

  describe '.find_shortest_path' do
    it 'return array with stations in sequence' do
      source = Station.find(114) #Harrow & Wealdston
      target = Station.find(143) #Kilburn Park

      expected_path_ids = [114, 140, 237, 185, 281, 246, 113, 298, 137, 206, 143]
      expect(@graph.find_shortest_path(source, target).map(&:id)).to eq(expected_path_ids)
    end

    it 'empty array when source or target is nil' do
      source = nil
      target = Station.find(143) #Kilburn Park

      expect(@graph.find_shortest_path(source, target)).to eq([])
      expect(@graph.find_shortest_path(target, source)).to eq([])
    end

  end

  describe '.shortest_path_time' do
    it 'return 0 seconds when source or target is nil' do
      source = nil #Harrow & Wealdston
      target = Station.find(143) #Kilburn Park

      expect(@graph.shortest_path_time(source, target)).to eq(0)
      expect(@graph.shortest_path_time(target, source)).to eq(0)
    end

    it 'return time in seconds' do
      source = Station.find(114) #Harrow & Wealdston
      target = Station.find(143) #Kilburn Park

      expected_seconds = 5580
      expect(@graph.shortest_path_time(source, target)).to eq(expected_seconds)
    end
  end
end

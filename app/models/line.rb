class Line < ActiveRecord::Base
  has_one :route, {foreign_key: :line, primary_key: :line}
  has_one :previous_station, {foreign_key: :id, primary_key: :station1, class_name: "Station"}
  has_one :next_station, {foreign_key: :id, primary_key: :station2, class_name: "Station"}
end

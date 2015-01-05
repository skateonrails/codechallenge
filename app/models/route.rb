class Route < ActiveRecord::Base
  has_many :lines, {foreign_key: :line, primary_key: :line}
end

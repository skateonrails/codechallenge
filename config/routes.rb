Rails.application.routes.draw do
  get 'api/path' => 'api#path'
  get 'api/shortest_path' => 'api#shortest_path'
  get 'api/shortest_path_with_time' => 'api#shortest_path_with_time'
end

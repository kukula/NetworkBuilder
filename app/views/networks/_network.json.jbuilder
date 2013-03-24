json.extract! network, :id, :name, :description, :color, :capacity
json.points network.points do |json, point|
  json.(point, :lat, :lng)
end
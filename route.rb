class Route 

  attr_reader :route_list

  def initialize(first, last)
    @route_list = [first, last]
  end

  def add_station(station)
    route_list.insert(route_list.size - 1, station)
  end

  def remove_station(station)
    route_list.delete(station) if route_list.size > 2 
  end
end

class Train 
  attr_reader :id, :route

  def initialize(id)
    @id = id
    @carriages = []
  end

  def route=(route)
    #уберем поезд со станции если переназначили маршрут 
    current_station.depart_train(self) if route
    @route = route
    current_station_index = 0 
    current_station.accept_train(self)
  end
  
  def current_station
    route.route_list[current_station_index]
  end

  def next_station
    route.route_list[current_station_index + 1]
  end

  def prev_station
    route.route_list[current_station_index -1]
  end

  def remove_carriage(carriage)
    carriages.delete(carriage) 
  end
  
  def add_carriage(carriage)
    carriages.push(carriage)
  end

  def go_next
    current_station_index += 1 if go(next_station)
  end

  def go_back  
    current_station_index -= 1 if go(prev_station)
  end

  protected 

  attr_reader  :current_station_index, :carriages
  
  #или лучше private?
  def go(station)
    if station
      current_station.depart_train(self)
      station.accept_train(self)
    end
  end

end

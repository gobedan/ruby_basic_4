class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = [] 
  end
 
  def trains_by_type(type)
    return trains.collect { |train|  train if train.type == type }  
  end

  def accept_train(train) 
    trains.push(train) unless trains.include?(train)
  end

  def depart_train(train)
    trains.delete(train) if trains.include?(train)
  end
end

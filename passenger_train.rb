require_relative './train.rb'

class PassengerTrain < Train
  
  def remove_carriage(carriage)
    super if carriage.type == type 
  end

  def add_carriage(carriage)
    super if carriage.type == type 
  end

  private
  #как вариант приватной константы 
  def type 
    :PassengerCarriage 
  end
end

require_relative './train.rb'

class CargoTrain < Train
  
  def remove_carriage(carriage)
    super if carriage.type == type 
  end

  def add_carriage(carriage)
    super if carriage.type == type 
  end

  private
  #как вариант приватной константы 
  def type 
    :CargoCarriage 
  end
end

require_relative './train.rb'

class CargoTrain < Train
 
  def add_carriage(carriage)
    super if carriage.type == valid_type 
  end

  def get_type 
    "Cargo"
  end
  
  private
  #как вариант приватной константы 
  def valid_type 
    :CargoCarriage 
  end
end

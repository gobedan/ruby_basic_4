require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './passenger_carriage.rb'
require_relative './cargo_carriage.rb'
require_relative './passenger_train.rb'
require_relative './cargo_train.rb'


def main_menu(command)
  case command
    when '1' then create_station 
    when '2' then create_train
    when '3' then create_route
    when '4' then route_menu
    when '5' then train_menu
    when '6' then station_list
    when 'help' then init_text  
    when 'exit' then { }
  else
    puts 'Wrong input! Type "help" for instructions'
  end
end

def create_station
  puts "Enter new station name: "
  print ":> > "
  station_name = gets.chomp
  stations.push(Station.new(station_name))
end

def create_train
  puts "Enter new train ID: "
  print ":> > "
  train_id = gets.chomp
  puts "Choose train type: 1 - Passenger, 2 - Cargo  "
  loop do
    print ":> > > "
    user_input = gets.chomp
    case user_input
      when '1' then 
        trains.push(PassengerTrain.new(train_id))
        # break в кейсе для выхода из loop! 
        break 
      when '2' then 
        trains.push(CargoTrain.new(train_id))
        break  
      when 'exit' then 
        break  
    else
      puts "Wrong input!"
  end
end

def create_route
  if stations.size > 2 
    puts "Choose start station (1..#{stations.size})"
    start_station = station_chooser
    puts "Choose end station (1..#{stations.size})"
    end_station = station_chooser
    routes.push(Route.new(start_station, end_station))
  else
    puts "Create more stations first!"
  end
end

def route_menu
end

def train_menu
end

def station_list
end

def station_chooser
  station_list
  loop do
    print ":> > "
    user_input = gets.chomp.to_i
    break stations[user_input] if stations[user_input]
    puts "Wrong station number!"
  end
end

def init_text 
  puts "Command list: "
  puts "'1' = Create new station"

end

init_text
trains = [] 
routes = [] 
stations = [] 
loop do 
  puts "Main menu:"
  print ":> "
  user_input = gets.chomp
  main_menu(user_input)
  break if user_input == 'exit'
end

end

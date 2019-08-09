require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './passenger_carriage.rb'
require_relative './cargo_carriage.rb'
require_relative './passenger_train.rb'
require_relative './cargo_train.rb'


def main_menu(command)
  case command
    when '1'  
      create_station 
    when '2'  
      create_train
    when '3'  
      create_route
    when '4'  
      route_menu
    when '5'  
      train_menu
    when '6'  
      station_list
    when 'help'  
      init_text  
    when 'exit'
      return
  else
    puts 'Wrong input! Type "help" for instructions'
  end
end

def create_station
  puts "Enter new station name: "
  print ":> > "
  station_name = gets.chomp
  $stations.push(Station.new(station_name))
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
      when '1'  
        $trains.push(PassengerTrain.new(train_id))
        # break в кейсе для выхода из loop! 
        break 
      when '2'  
        $trains.push(CargoTrain.new(train_id))
        break  
      when 'exit'  
        break  
    else
      puts "Wrong input!"
    end
  end
end

def create_route
  if $stations.size >= 2 
    puts "Choose start station (1..#{$stations.size})"
    start_station = station_chooser
    puts "Start"
    puts "  |1.#{start_station.name}"
    puts "  |2. ..."
    puts "End"
    puts "Choose end station (1..#{$stations.size})"
    end_station = station_chooser
    puts "Start"
    puts "  |1.#{start_station.name}"
    puts "  |2.#{end_station.name}"
    puts "End"
    $routes.push(Route.new(start_station, end_station))
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
    break $stations[user_input-1] if $stations[user_input-1]
    puts "Wrong station number!"
  end
end

def init_text 
  puts "Command list: "
  puts "'1' = Create new station"
  puts "'2' = Create new train"
  puts "'3' = Create new route"

  puts "'help' = print command list"
  puts "'exit' = exit"
    

end

init_text
$trains = [] 
$routes = [] 
$stations = [] 
loop do 
  puts "Main menu:"
  print ":> "
  user_input = gets.chomp
  main_menu(user_input)
  break if user_input == 'exit'
end

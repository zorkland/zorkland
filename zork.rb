require './world.rb'

world = World.new

puts "hello traveler, welcome to the land of EDDDYYYYYY"

while(true)
  begin
    puts "you are currently at " + world.where_am_i.name + ", " + world.current_description
    puts "you can travel to: " + world.current_exits.to_a.join(', ')
    puts "where would you like to go?"
    STDOUT.flush  
    desired_location = gets.chomp.to_sym  
    world.go_to(desired_location)
  rescue
    puts 'STOP TRYING TO CHEAT R U N MURCAN?!?!'
    retry
  end
end

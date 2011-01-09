require 'set'

class Location
  attr_reader :name, :description, :exits

  def initialize(name, description, exits)
    @name = name
    @description = description
    @exits = exits
  end
end

class World
  attr_reader :current_location
 
  def initialize
    @current_location = :forest
    @places = {
      :forest =>  Location.new('forest','a dark scary forest', Set[:tree, :castle]),
      :castle => Location.new('castle','fat castle', Set[:forest, :pit]),
      :pit => Location.new('pit','a dark tar filled pit', Set[:castle]),
      :portal => Location.new('portal','a mysterious woosh woosh portal', Set[:forest, :castle, :pit, :tree]),
      :tree => Location.new('tree','a mystic tree', Set[:portal, :forest]),
    }
  end

  def where_am_i
    @places[@current_location]
  end
  
  def current_description
    where_am_i.description
  end
  
  def go_to(new_location)
    if ! current_exits.include?(new_location)
      raise "cannot skip locations"
    end
    @current_location = new_location
  end

  def current_exits
    where_am_i.exits
  end

end

w=World.new
puts "hello traveler, welcome to the land of EDDDYYYYYY"
while(true)
 begin
  puts "you are currently at " + w.where_am_i.name + ", " + w.current_description
  puts "you can travel to: " + w.current_exits.to_a.join(', ')
  puts "where would you like to go?"
  STDOUT.flush  
  desired_location = gets.chomp.to_sym  
  w.go_to(desired_location)
rescue
  puts 'STOP TRYING TO CHEAT R U N MURCAN?!?!'
  retry
end

end

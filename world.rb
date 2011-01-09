class World
 
  def initialize(current_location)
    @current_location = current_location
  end

  def where_am_i
    @current_location
  end
  
  def current_description
    @current_location.description
  end
  
  def go_to(new_location)
    @current_location = new_location
  end
    
end

class Location
  attr_reader :name, :description
  
  def initialize(name, description)
    @name = name
    @description = description
  end
end



# a = World.new
# a.description
# a.description = "the forest of will, green and scary (with monsters)"
# 
# Animals
#   Cats
#   Dogs
#   Snakes
# Names
# Colors

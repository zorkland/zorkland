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
      :forest =>  Location.new('forest','a dark scary forest', [:tree, :castle]),
      :castle => Location.new('castle','fat castle', [:forest, :pit]),
      :pit => Location.new('pit','a dark tar filled pit', [:castle]),
      :portal => Location.new('portal','a mysterious woosh woosh portal', [:forest, :castle, :pit, :tree]),
      :tree => Location.new('tree','a mystic tree', [:portal, :forest]),
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

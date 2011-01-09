require './v2.rb'
require 'set'

describe World do
  before do
    @world = World.new
    @forest = Location.new('forest','a dark scary forest', Set[:tree, :castle])
  end

  it 'starts out in the forest' do
    @world.current_location.should eq :forest
  end

  it '#current_description returns description of current loc' do
    @world.current_description.should eq 'a dark scary forest'
  end

  it 'shows you list of possible exits' do
    @world.current_exits.should eq Set[:castle, :tree]
  end

  it 'lets you go to possible places' do
    @world.go_to(:castle)
    @world.current_location.should eq :castle
    @world.go_to(:forest)
    @world.current_location.should eq :forest
  end
  
  it 'blocks impossible places' do
    proc { @world.go_to(:portal) }.should raise_error # eq "cannot skip locations"
  end

end

describe Location do
  before do
    @forest = Location.new('forest','a dark scary forest', Set[:tree, :castle])
  end
  
  it 'has a description and name' do
    @forest.description.should eq 'a dark scary forest'
    @forest.name.should eq 'forest'
  end
  
  it 'has exits' do
    @forest.exits.should eq Set[:tree, :castle]
  end
end

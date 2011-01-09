require './world.rb'

describe World do
  before do
    @forest = Location.new('forest','a dark scary forest')
    @castle = Location.new('castle','fat castle')
    @world = World.new(@forest)
  end

  it 'starts out in the forest' do
    @world.where_am_i.should eq @forest
  end

  it '#description returns description of current loc' do
    @world.current_description.should eq @forest.description
  end

  it 'lets you go to the castle and return' do
    @world.go_to(@castle)
    @world.where_am_i.should eq @castle
    @world.current_description.should eq @castle.description
    @world.go_to(@forest)
    @world.where_am_i.should eq @forest
    @world.current_description.should eq @forest.description 
  end
end

describe Location do
  it 'has a description and name' do
    location = Location.new('name','description')
    location.description.should eq 'description'
    location.name.should eq 'name'
  end
end

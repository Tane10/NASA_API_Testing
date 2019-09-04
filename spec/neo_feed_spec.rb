require 'spec_helper'

describe 'Neo feed spec' do
	context 'Retrieve a list of Asteroids based on their closest approach date to Earth.' do
    before(:all) do
			@neo_feed = Nasa.new.neo_feed
      @neo_feed.get_feed_startdate_enddate("2018-04-11","2018-04-12")
		end

		it 'should have a links hash containing 3 keys' do
        expect(@neo_feed.get_hash['links'].keys.count).to eq 3
    end 

    it 'should have a neo_reference_id key containing a string of 7 charectors' do
      expect(@neo_feed.get_neo_reference_id.length).to eq 7
    end
    
    it 'should have a name key containing a string' do
      expect(@neo_feed.get_near_earth_objects_hash['name']).to be_a(String)
    end

    it 'should have a nasa_jpl_url key containing a http string' do
      expect(@neo_feed.get_near_earth_objects_hash['nasa_jpl_url']).to be_a(String)
      expect(@neo_feed.get_near_earth_objects_hash['nasa_jpl_url']).to include('http')
    end

    it 'should have a absolute_magnitude_h key containing float' do
      expect(@neo_feed.get_near_earth_objects_hash['absolute_magnitude_h']).to be_a(Float)
    end

    it 'should have a estimated_diameter hash containing a 4 keys labelded kilometers,
    meters, miles, feet' do
      expect(@neo_feed.get_estimated_diameter_hash).to be_a(Hash)
      expect(@neo_feed.get_estimated_diameter_hash.keys.count).to eq 4
      expect(@neo_feed.get_estimated_diameter_hash.keys).to include('kilometers')
      expect(@neo_feed.get_estimated_diameter_hash.keys).to include('meters')
      expect(@neo_feed.get_estimated_diameter_hash.keys).to include('miles')
      expect(@neo_feed.get_estimated_diameter_hash.keys).to include('feet')
    end

    it 'should have a estimated_diameter_min float smaller then estimated_diameter_max' do
      expect(@neo_feed.get_estimated_diameter_kilometers['estimated_diameter_min']).to be < @neo_feed.get_estimated_diameter_kilometers['estimated_diameter_max']
      expect(@neo_feed.get_estimated_diameter_feet['estimated_diameter_min']).to be < @neo_feed.get_estimated_diameter_feet['estimated_diameter_max']
      expect(@neo_feed.get_estimated_diameter_miles['estimated_diameter_min']).to be < @neo_feed.get_estimated_diameter_miles['estimated_diameter_max']
      expect(@neo_feed.get_estimated_diameter_meters['estimated_diameter_min']).to be < @neo_feed.get_estimated_diameter_meters['estimated_diameter_max']
    end

    it 'should have a estimated_diameter_max float larger then estimated_diameter_min' do
      expect(@neo_feed.get_estimated_diameter_kilometers['estimated_diameter_max']).to be > @neo_feed.get_estimated_diameter_kilometers['estimated_diameter_min']
      expect(@neo_feed.get_estimated_diameter_feet['estimated_diameter_max']).to be > @neo_feed.get_estimated_diameter_feet['estimated_diameter_min']
      expect(@neo_feed.get_estimated_diameter_miles['estimated_diameter_max']).to be > @neo_feed.get_estimated_diameter_miles['estimated_diameter_min']
      expect(@neo_feed.get_estimated_diameter_meters['estimated_diameter_max']).to be > @neo_feed.get_estimated_diameter_meters['estimated_diameter_min']
    end

    it 'should have a is_potentially_hazardous_asteroid key which returns true or false' do
      expect(@neo_feed.get_near_earth_objects_hash['is_potentially_hazardous_asteroid']).to be false
      expect(@neo_feed.get_near_earth_objects_hash['is_potentially_hazardous_asteroid']).should_not be true
    end

    it 'should have a close_approach_data array' do
      expect(@neo_feed.get_near_earth_objects_hash['close_approach_data']).to be_a(Array)
    end

    it 'should have a relative_velocity hash containing kilometers_per_second,
    kilometers_per_hour, miles_per_hour' do
      expect(@neo_feed.get_relative_velocity).to include('kilometers_per_second')
      expect(@neo_feed.get_relative_velocity).to include('kilometers_per_hour')
      expect(@neo_feed.get_relative_velocity).to include('miles_per_hour')
    end

    it 'should have a kilometers_per_second, kilometers_per_hour, miles_per_hour keys which 
    return strings' do
      @neo_feed.get_relative_velocity.each do |k, v|
        expect(@neo_feed.get_relative_velocity[k][v]).to be_a(String)
      end 
    end

    it 'should have a miss_distance hash containing astronomical, lunar, kilometers,
    miles keys, that return strings' do
      expect(@neo_feed.get_miss_distance).to be_a(Hash)
      expect(@neo_feed.get_miss_distance).to include('astronomical')
      expect(@neo_feed.get_miss_distance).to include('lunar')
      expect(@neo_feed.get_miss_distance).to include('kilometers')
      expect(@neo_feed.get_miss_distance).to include('miles')
    end

    it 'should have an orbiting_body key which returns a string' do
      expect(@neo_feed.get_orbiting_body).to be_a(String)
    end
  end
end
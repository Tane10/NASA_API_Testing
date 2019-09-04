require 'spec_helper'

describe 'Neo browse spec' do
  context 'Browse the overall Asteroid data-set GET https://api.nasa.gov/neo/rest/v1/neo/browse/
    EXAMPLE QUERY
    https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY' do

    before(:all) do
      @neo_browse = Nasa.new.neo_browse
      @neo_browse.get_browse
    end


    it 'should have a links hash' do
      expect(@neo_browse.get_links_hash).to be_a(Hash)   
    end 

    it 'should have a page hash containing 4 keys all returing integers' do
      expect(@neo_browse.get_page_hash.keys.count).to eq 4
      @neo_browse.get_page_hash.each do |k,v|
        expect(@neo_browse.get_page_hash[k][v]).to be_a(Integer)
      end
    end 

    it 'should have a near_earth_objects array' do
      expect(@neo_browse.get_near_earth_objects_array).to be_a(Array)
    end

    it 'should have a neo_reference_id key containing a string of 7 charectors' do
      expect(@neo_browse.get_near_earth_objects_array[0]).to include('neo_reference_id')
      expect(@neo_browse.get_neo_referance_id).to be_a(String)
      expect(@neo_browse.get_neo_referance_id.length).to eq 7
    end
      
    it 'should have a name key containing a string' do
      expect(@neo_browse.get_name_key).to be_a(String)
    end

    it 'should have a nasa_jpl_url key containing a http string' do
      expect(@neo_browse.get_nasa_jpl_url).to be_a(String)
      expect(@neo_browse.get_nasa_jpl_url).to include('http')
    end

    it 'should have a absolute_magnitude_h key containing float' do
      expect(@neo_browse.get_absolute_magnitude_h).to be_a(Float)
    end

    it 'should have a estimated_diameter hash containing a 4 keys labelded kilometers,
    meters, miles, feet. Which return floats' do
      expect(@neo_browse.get_estimated_diameter).to be_a(Hash)
      expect(@neo_browse.get_estimated_diameter.keys.count).to eq 4
      
      @neo_browse.get_estimated_diameter.keys.each do |k|
        expect(@neo_browse.get_estimated_diameter).to include('kilometers','meters','miles','feet')
        expect(@neo_browse.get_estimated_diameter[k]['estimated_diameter_min']).to be_a(Float)
        expect(@neo_browse.get_estimated_diameter[k]['estimated_diameter_max']).to be_a(Float)
      end
    end

    it 'should have a estimated_diameter_min float smaller then estimated_diameter_max' do
      @neo_browse.get_estimated_diameter.keys.each do |v|
        expect(@neo_browse.get_estimated_diameter[v]['estimated_diameter_min']).to be < @neo_browse.get_estimated_diameter[v]['estimated_diameter_max']
      end
    end

    it 'should have a estimated_diameter_max float larger then estimated_diameter_min' do
      @neo_browse.get_estimated_diameter.keys.each do |v|
        expect(@neo_browse.get_estimated_diameter[v]['estimated_diameter_max']).to be > @neo_browse.get_estimated_diameter[v]['estimated_diameter_min']
      end
    end

    it 'should have a is_potentially_hazardous_asteroid key which returns true or false' do
      expect(@neo_browse.get_is_potentially_hazardous_asteroid).to be false
      expect(@neo_browse.get_is_potentially_hazardous_asteroid).should_not be false
    end

    it 'should have a close_approach_data array' do
      expect(@neo_browse.get_close_approach_data_array).to be_a(Array)
    end

    it 'should have an orbiting_body key which returns a string' do
      expect(@neo_browse.get_orbiting_body).to be_a(String)
    end

    it 'should have an orbit_id containing a string' do
      expect(@neo_browse.get_orbit_id).to be_a(String)
    end

    it 'should have an orbit_determination_date containing a string' do
      expect(@neo_browse.get_orbit_determination_date).to be_a(String)
    end
    
    it 'should have an orbital_data contain 18 keys' do
      expect(@neo_browse.get_orbital_data.keys.count).to eq 18
    end

    it 'should have an orbital_data hash with every key containing string data' do
      @neo_browse.get_orbital_data.keys.each do |i|
        expect(@neo_browse.get_orbital_data[i]).to be_a(String)
      end
    end
  end
end
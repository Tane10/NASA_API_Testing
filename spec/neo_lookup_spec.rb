require 'spec_helper'

describe 'Neo look up spec' do

    context 'Lookup a specific Asteroid based on its NASA JPL small body 
    (SPK-ID) ID GET https://api.nasa.gov/neo/rest/v1/neo/' do

        before(:all) do
            @neo_lookup = Nasa.new.neo_lookup
            @spk_ids = ["2000433","2000719","2000887","2001036","2001221"]
            @neo_lookup.get_lookup_with_id(@spk_ids[0])
            @relative_velocity_speeds = ['kilometers_per_second',
            'kilometers_per_hour', 'miles_per_hour']
        end


        it 'should have a links is a hash' do   
            expect(@neo_lookup.get_links_hash).to be_a(Hash)
        end 

        it 'should have a neo_referance_id key containing a string of 7 charectors' do
            expect(@neo_lookup.get_neo_referance_id.length).to eq 7
        end
          
        it 'should have a name key containing a string' do
            expect(@neo_lookup.get_name_key).to be_a(String)
        end
      
        it 'should have a nasa_jpl_url key containing a http string' do
            expect(@neo_lookup.get_nasa_jpl_url).to be_a(String) and include('http')
        end 

        it 'should have a absolute_magnitude_h key containing float' do
            expect(@neo_lookup.get_absolute_magnitude_h).to be_a(Float)
        end
    
        it 'should have a estimated_diameter hash containing a 3 keys labelded kilometers,
        meters, miles, feet' do
            expect(@neo_lookup.get_estimated_diameter).to be_a(Hash)
            expect(@neo_lookup.get_estimated_diameter.keys.each).to include('kilometers',
                'meters', 'miles', 'feet')
        end
    
        it 'should have a estimated_diameter_min float equal or less than  estimated_diameter_max' do
            @neo_lookup.get_estimated_diameter.keys.each do |i|
                expect(@neo_lookup.get_estimated_diameter[i]['estimated_diameter_min']).to be <=  @neo_lookup.get_estimated_diameter[i]['estimated_diameter_max']
            end
        end
    
        it 'should have a estimated_diameter_max float  equal or less than estimated_diameter_min' do
            @neo_lookup.get_estimated_diameter.keys.each do |i|
                expect(@neo_lookup.get_estimated_diameter[i]['estimated_diameter_max']).to be >=  @neo_lookup.get_estimated_diameter[i]['estimated_diameter_min']
            end
        end
    
        it 'should have a is_potentially_hazardous_asteroid key which returns true or false' do
            expect(@neo_lookup.get_is_potentially_hazardous_asteroid).to be false and should_not be true
        end
    
        it 'should have a close_approach_data array' do
            expect(@neo_lookup.get_close_approach_data_array).to be_a(Array)
        end

        it 'should have a relative_velocity hash containing kilometers_per_second,
        kilometers_per_hour, miles_per_hour' do
            # expect(@neo_Lookup.get_relative_velocity).to be_a(Hash)
        
        pending
        end
    
        it 'should have a kilometers_per_second, kilometers_per_hour, miles_per_hour keys which 
        return floats' do
          # expect(@neo_feed.print_results).to eq 2
          pending
        end
    
        it 'should have a miss_distance hash containing astronomical, lunar, kilometers,
        miles keys, that return strings' do
        #   expect(@neo_lookup.get_miss_distance).to be_a(Hash)
            # @neo_look
          pending
          
        end

        it 'should have an orbiting_body key which returns a string' do
            pending
        end

        it 'should have an orbital_data hash' do
            pending
        end

        it 'should have an orbital_id containing a string' do
            pending
        end

        it 'should have an orbit_determination_date containing a string' do
            pending
        end
        
        it 'should have an orbital_data contain 18 keys' do
            pending
        end

        it 'should have an orbital_data hash with every key containing string data' do
            pending
        end
        



    end


end
require 'httparty'
require 'json'

class NeoFeedService
  include HTTParty

  base_uri 'https://api.nasa.gov/neo/rest/v1/feed?'

  def initialize
    @api_key = 'kcO5eqbhy64BiIF115BRdAezsIZ0uT5jzHD0prED'
  end

  def get_feed_startdate_enddate(start_date,end_date)
    @nasa_feed = JSON.parse(self.class.get("/start_date=#{start_date}&end_date=#{end_date}&api_key=#{@api_key}").body)
  end

  def print_results
    puts JSON.pretty_generate(@nasa_feed).gsub(":", " =>")
  end

  def get_hash
    @nasa_feed
  end
  
  def get_neo_reference_id
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['neo_reference_id']
  end

  def get_near_earth_objects_hash
    @nasa_feed['near_earth_objects']['2018-04-12'][1]
  end
 
  def get_estimated_diameter_hash
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['estimated_diameter']
  end

  def get_estimated_diameter_kilometers
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['estimated_diameter']['kilometers']
  end

  def get_estimated_diameter_meters
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['estimated_diameter']['meters']
  end

  def get_estimated_diameter_feet
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['estimated_diameter']['feet']
  end

  def get_estimated_diameter_miles
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['estimated_diameter']['miles']
  end
  
  def get_relative_velocity
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['close_approach_data'][0]['relative_velocity']
  end

  def get_miss_distance
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['close_approach_data'][0]['miss_distance']
  end

  def get_orbiting_body
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['close_approach_data'][0]['orbiting_body']
  end

  def get_close_approach_data
    @nasa_feed['near_earth_objects']['2018-04-12'][1]['close_approach_data'][0]
  end
end 
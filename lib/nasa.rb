require_relative 'services/neo_browse'
require_relative 'services/neo_lookup'
require_relative 'services/neo_feed'

class Nasa

    def neo_feed
        NeoFeedService.new
    end 

    def neo_lookup
        NeoLookUpService.new
    end

    def neo_browse
        NeoBrowseService.new
    end
    


end

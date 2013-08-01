# Taken from: http://blog.confabulus.com/2008/12/30/making-your-plugin-or-gem-configurable/
module IS24At
  
  class Config
    
    attr_writer :api_key
    attr_writer :api_endpoint

    attr_writer :enable_logging
    attr_writer :enable_debugging
    attr_writer :default_search_options
    attr_writer :default_radius_search_options
    
    def initialize # :nodoc:
      self.api_endpoint = 'https://api.immobilienscout24.at'
      self.enable_logging = false
      self.enable_debugging = false
      self.default_search_options = {}
      self.default_radius_search_options = {}
    end
    
    def api_version
      'v2'
    end
    
    def api_key #:nodoc:
      @api_key
    end
    
    def api_endpoint #:nodoc:
      @api_endpoint
    end
    
    def enable_logging
      @enable_logging
    end
    
    def enable_debugging
      @enable_debugging
    end
    
    def default_search_options
      @default_search_options
    end
    
    def default_radius_search_options
      @default_radius_search_options
    end
    
  end
end
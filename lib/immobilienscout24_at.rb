# Include external dependencies
require 'oauth'
require 'multi_json'

require 'immobilienscout24_at/version'

require 'immobilienscout24_at/models/config'
require 'immobilienscout24_at/models/exception'
require 'immobilienscout24_at/models/api'

require 'immobilienscout24_at/models/search'
require 'immobilienscout24_at/models/search_result'

module IS24At
  
  def self.configure(configuration = IS24At::Config.new)
    yield configuration if block_given?
    @@configuration = configuration
  end
      
  def self.config
    @@configuration ||= IS24At::Config.new
  end
  
end

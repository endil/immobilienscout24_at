module IS24At
  class Expose

    #
    # Instance Methods
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    def initialize(attributes={})
      @attributes = attributes
    end

    def attributes
      @attributes
    end
=begin
    def id
      @id ||= attributes['id']
    end

    def title
      @title ||= attributes['title']
    end

    def url
      @url ||= attributes['url']
    end

    def area
      @area ||= attributes['area']
    end

    def marketing_type
      @marketing_type ||= attributes['marketingType']
    end

    def property_type
      @property_type ||= attributes['propertyType']
    end

    def picture_id
      @picture_id ||= attributes['pictureId']
    end

    def price
      @price ||= attributes['price']
    end

    def rooms
      @rooms ||= attributes['rooms']
    end

    def is_private_insertion
      @is_private_insertion ||= attributes['isPrivateInsertion']
    end

    def address
      @address ||= attributes['address']
    end

    def show_address
      @show_address ||= address['showAddress']
    end

    def street
      @street ||= address['street']
    end

    def street_number
      @street_number ||= address['streetNumber']
    end

    def city
      @city ||= address['city']
    end

    def country
      @country ||= address['country']
    end

    def postcode
      @postcode ||= address['zipCode']
    end

    def title_picture
      @title_picture ||= attributes['titlePicture']
    end

    def with_title_picture?
      title_picture.present?
    end

    def title_picture_id
      @title_picture_id ||= title_picture['id']
    end

    def title_picture_url
      @title_picture_url ||= title_picture['url']
    end

    def geocoordinate
      @geocoordinate ||= attributes['geocoordinate']
    end

    def latitude
      @latitude ||= geocoordinate.present? ? geocoordinate['latitude'] : nil
    end

    def longitude
      @longitude ||= geocoordinate.present? ? geocoordinate['longitude'] : nil
    end

    def distance
      @distance ||= geocoordinate.present? ? geocoordinate['distanceFromReference'] : nil
    end

    def geocoded?
      longitude.present? && latitude.present?
    end
=end

    #
    # Class methods
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    def self.exists?(expose_id)
      response = IS24At::Api.new.get_request("#{IS24At.config.api_version}/expose/#{expose_id}")
      case response.code
      when '200'
        return true
      when '400', '404'
        return false
      end
    end

    #
    # Protected
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    protected

    #
    # Private
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    private

  end
end
module IS24At
  class Search < Api

    #
    # Instance Methods
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    def in_radius(latitude, longitude, radius, *args)
      options = IS24At.config.default_radius_search_options.merge(args.extract_options!)
      query(
        options.merge({
          :'searchRadius.center.latitude' => latitude,
          :'searchRadius.center.longitude' => longitude,
          :'searchRadius.distance' => radius
        })
      )
    end

    def query(*args)
      options = IS24At.config.default_search_options.merge(args.extract_options!)
      return get_pages("#{IS24At.config.api_version}/resultlist?#{options.to_query}").collect { |result| IS24At::SearchResult.new(result) }
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
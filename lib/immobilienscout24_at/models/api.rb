module IS24At
  class Api

    #
    # Requests
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    def get(url, options={})
      return decode(get_request(url))
    end

    def get_request(url)

      if IS24At.config.enable_logging
        request_startet_at = Time.now
        Rails.logger.info "IS24At::Api.get: Startet at #{request_startet_at.iso8601}"
        Rails.logger.info "IS24At::Api.get: API-Key is present" if IS24At.config.api_key.present?
        Rails.logger.info "IS24At::Api.get: Requested: #{IS24At.config.api_endpoint}/#{url}"
      end

      uri = URI.parse("#{IS24At.config.api_endpoint}/#{url}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.set_debug_output($stdout) if IS24At.config.enable_debugging

      request = Net::HTTP::Get.new(uri.request_uri)
      request.add_field('Authorization', IS24At.config.api_key) if IS24At.config.api_key.present?
      response = http.request(request)

      if IS24At.config.enable_logging
        request_finished_at = Time.now
        Rails.logger.info "IS24At::Api.get: Finished at #{request_finished_at.iso8601} in #{((request_finished_at - request_startet_at) * 1000).to_i} milliseconds\n\n"
      end

      return response
    end

    def get_pages(url, page_number=1)
      results = Array.new
      response = get("#{url}&paging.pageNumber=#{page_number}")

      number_of_hits = response['totalNumberOfListings'].to_i
      if number_of_hits > 0
        results = response['listings']
        current_page = response['searchCriteria']['paging']['pageNumber'].to_i

        if current_page < response['totalNumberOfPages'].to_i
          results.concat(get_pages(url, current_page.next))
        end
      end
      return results
    end

    def decode(response)
      if response.is_a?(Net::HTTPClientError)
        error = MultiJson.decode(response.body)['errors']
        raise(IS24At::Exception::APIError, "#{response.class.name} (code: #{response.code}) - #{error}")
      end

      if response.body =~ /../
        MultiJson.decode(response.body)
      end
    end

  end
end
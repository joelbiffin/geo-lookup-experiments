class LocationIQClient
  class Response
    def initialize(data)
      @data = data
    end

    def results
      JSON.parse(@data.body).map do |result|
        OpenStruct.new(result.slice("display_name", "display_place"))
      end
    end
  end

  def initialize(type: :city)
    @type = type
    @api_key = ENV.fetch("LOCATION_IQ_KEY")
    @api_host = "https://api.locationiq.com/v1"
    @allowed_countries = [:us, :gb].join(",")
  end

  def autocomplete(search_string)
    params = {
      key: api_key,
      q: search_string,
      countrycodes: allowed_countries,
      tag: "place:#{type}"
    }

    Response.new(
      Faraday.get("#{api_host}/autocomplete?#{params.to_query}")
    ).results
  end

  private

  attr_reader :type, :api_key, :api_host, :allowed_countries
end

class ArcgisClient
  class Response
    def initialize(data)
      @data = data
    end

    def results
      JSON.parse(@data.body)["suggestions"].map do |result|
        OpenStruct.new(result["text"])
      end
    end
  end

  def initialize(type: :city)
    @type = type
    @api_key = ENV.fetch("ARCGIS_KEY")
    @api_root = "https://geocode-api.arcgis.com/arcgis/rest/services/World/GeocodeServer"
    @allowed_countries = [:us, :gb].join(",")
  end

  def autocomplete(search_string)
    params = {
      f: :json,
      token: api_key,
      category: type.to_s.upcase,
      countryCode: allowed_countries.upcase,
      text: search_string
    }

    Response.new(
      Faraday.get("#{api_root}/suggest?#{params.to_query}")
    ).results
  end

  private

  attr_reader :type, :api_key, :api_root, :allowed_countries
end

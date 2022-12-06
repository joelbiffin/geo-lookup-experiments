require "faraday"

class GeoapifyClient
  class Response
    def initialize(data)
      @data = data
    end

    def results
      JSON.parse(@data.body)["features"].map do |result|
        OpenStruct.new(result["properties"])
      end
    end
  end

  def initialize(type:)
    @type = type
    @api_root = "https://api.geoapify.com/v1/geocode"
    @api_key = ENV.fetch("GEOAPIFY_KEY")
    @allowed_countries = [:gb, :us].join(",")
  end

  def autocomplete(string)
    params = {
      text: string,
      apiKey: api_key,
      type: type,
      filter: "countrycode:#{allowed_countries}"
    }

    Response.new(
      Faraday.get("#{api_root}/autocomplete?#{params.to_query}")
    ).results
  end

  private

  attr_reader :api_root, :api_key, :type, :allowed_countries
end

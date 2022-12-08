class City
  class << self
    def where(search_string, client: NullClient.new)
      client.autocomplete(search_string).map do |result|
        new(result)
      end
    end
  end

  def initialize(city)
    @city = city
  end

  def as_json(options = nil)
    city.to_h
  end

  private

  attr_reader :city
end

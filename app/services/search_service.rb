class SearchService
  def initialize
    @conn = Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['NREL_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search(location)
    response = @conn.get "nearest.json?location=#{location}&radius=6&fuel_type=ELEC,LPG"
    search_results = JSON.parse(response.body, symbolize_names: true)
    limit_search(search_results)
  end

  def limit_search(search_results)
    search_results[:fuel_stations][0..9]
  end

  def name
    @search_results[:fuel_stations][:station_name]
  end

  def self.search(location)
    SearchService.new.search(location)
  end
end
class SearchService
  def initialize
    @conn = Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['NREL_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search(location)
    @conn.get "nearest.json?location=#{location}&radius=6&fuel_type=ELEC,LPG"
  end

  def self.search(location)
    SearchService.new.search(location)
  end
end
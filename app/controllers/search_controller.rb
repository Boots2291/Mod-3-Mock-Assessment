class SearchController < ApplicationController
  def index
    location = params['q']
    conn = Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1') do |faraday|
      faraday.headers['X-Api-Key'] = 'GOMaGJFgLFE8sIl5TzIqqYC9JBiPymZTj6QkCowT'
      faraday.adapter  Faraday.default_adapter
    end
    @search_results = conn.get "nearest.json?location=#{location}&radius=6&fuel_type=ELEC,LPG"
  end
end
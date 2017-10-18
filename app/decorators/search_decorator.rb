class SearchDecorator < SimpleDelegator
  def initialize(search_results)
    @search_results = search_results
  end

  def name
    @search_results[:fuel_stations][:station_name]
  end
end
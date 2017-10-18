class SearchDecorator < SimpleDelegator
  def initialize(search_results)
    @search_results = search_results
  end

  def first_ten
    @search_results[:fuel_stations][0..9]
  end

  def name
    @search_results[:fuel_stations][:station_name]
    byebug
  end
end
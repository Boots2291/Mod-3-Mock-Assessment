class SearchController < ApplicationController
  def index
    location = params['q']
    @search_results = SearchDecorator.new(SearchService.search(location))
  end
end
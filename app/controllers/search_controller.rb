class SearchController < ApplicationController
  def index
    location = params['q']
    @search_results = SearchService.search(location)

  end
end
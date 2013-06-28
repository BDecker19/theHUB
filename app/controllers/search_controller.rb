class SearchController < ApplicationController
  def results
  	@results = User.search params[:search]
  end
end

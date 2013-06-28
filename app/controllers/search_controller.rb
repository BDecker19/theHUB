class SearchController < ApplicationController
  def results
  	@query = Query.new
  	@query.text = params[:search]
  	@query.save

  	@results = User.search params[:search]
  end
end

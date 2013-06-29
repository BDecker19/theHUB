class SearchController < ApplicationController
  def results

  	# archive the query for data intelligence
  	@query = Query.new
  	@query.text = params[:search]
  	@query.save

  	# retrieve direct results
  	@direct_results = User.search params[:search]


  	# determine relevancy category ### hacked for now...
  	@category_id = 1

  	binding.pry

  	# retrieve relevancy results
  	@relevancies = Relevancy.where("category_id = ?", @category_id).order("score DESC").limit(5)  	
  	@relevancy_results = []
  	@relevancies.each {|relevancy| @relevancy_results << relevancy.user_id}


  	### will also want to eager load user associations... including whatever USER info will be needed to populate member previews?  does that meean you'll have to pull this for everyone, or just the 5 identified?

  end
end

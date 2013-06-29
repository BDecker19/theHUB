class LikesController < ApplicationController
 	
  # POST -- need to create route!!
  def create

     binding.pry

     # create new like
     @like = Like.new
     @like.liker_id = current_user.id
     @like.liked_id = params[:acted_on_id]
     @like.liked_type = params[:acted_on_type]
     @like.save

     # create or find relevancy
     # ### -- if type comes back as Article, need to make sure this will search the ContentItems table (not looks for an Articles table)
     # ### -- also not sure find can work like this?
     


     @action = Action.new
     @action.actor_id = current_user.id
     @action.action_product_id = @like.id
     @action.action_product_type = "like" 
     @action.acted_on_id = params[:acted_on]
     @action.acted_on_type = params[:acted_on_type]
     @action.relvancy_id = params[:acted_on]

     @action.save
  
     redirect_to "/#{params[:acted_on_type]}s/#{params[:acted_on]}"

  end
end


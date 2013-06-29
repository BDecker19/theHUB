class LikesController < ApplicationController
 	
  # POST -- need to create route!!
  def create
     @like = Like.new
     @like.liker_id = current_user.id
     @like.liked_id = params[:acted_on]
     @like.liked_type = params[:acted_on_type]
     @like.save

     @action = Action.new
     @action.actor_id = current_user.id
     @action.action_product_id = @like.id
     @action.action_product_type = "like" 
     @action.acted_on_id = params[:acted_on]
     @action.acted_on_type = params[:acted_on_type]
     @action.save
  end
end


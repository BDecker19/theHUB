class LikesController < ApplicationController
 	
  # POST
  def create
    
    @object_acted_on = params[:acted_on_type].constantize.find(params[:acted_on_id])

    ### NOTE -- TODO... these should all probably go their respective models?

    # create new like
    @like = Like.new :liker_id => current_user.id, :liked_id => @object_acted_on.id, :liked_type => @object_acted_on.type
        # uses 'constructor' gem ### is there any reason NOT to use this??
        # likedtype stores subclass, not parent class (for parent, use ".class.model_name") 
    @like.save

    # create action
    @action = Action.new :actor_id => current_user.id, :action_product_id => @like.id, :action_product_type => "like",  :acted_on_id => @object_acted_on.id, :acted_on_type => @object_acted_on.type, :relevancy_value => 1
        ### action_product_type... matters referred to explicitly rather than via 'class.name'?
        # acted_on_type... ditto previous note on storing subclass
        # relevancy_value... custom value associated with like action ###should be converted to class variable -- see http://bit.ly/15RgiuK

    # update or create relevancy
        #check if user already has relevancy for category
        if(!current_user.relevancies.select{|relevancy| relevancy.category_id == @object_acted_on.category_id}.empty?)
            # if relevancy found...
            @relevancy = Relevancy.where("user_id = ? AND category_id = ?", current_user.id, @object_acted_on.category_id)[0]  ### should also have check to confirm only 1 result found
            @relevancy.score += @action.relevancy_value
        else
            # if no relevancy found... 
            @relevancy = Relevancy.new
            @relevancy.user_id = current_user.id
            @relevancy.category_id = @object_acted_on.category.id
            @relevancy.score = @action.relevancy_value
        end
    @relevancy.save

    # associate action with relevancy then save
    @action.relevancy_id = @relevancy.id
    @action.save
  
    redirect_to @object_acted_on

  end
end


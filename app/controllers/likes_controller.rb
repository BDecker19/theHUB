class LikesController < ApplicationController
 	
  # POST  ...attribute variables set via 'constructor' gem.  '.type' varibles reference subclass, not parent (for parent, use ".class.model_name")
  def create
    @object_acted_on = params[:acted_on_type].constantize.find(params[:acted_on_id])

    # create new like ...### read you're not supposed to overwrite initialize method?
    @like = Like.new
    @like.set_vals({:liker => current_user, :liked => @object_acted_on})
    binding.pry
    @like.save

    # create action  (relevancy_value = custom value associated with like action ###should prb be converted to class variable -- eg http://bit.ly/15RgiuK)
    @action = Action.new :actor_id => current_user.id, :action_product_id => @like.id, :action_product_type => "like", :acted_on_id => @object_acted_on.id, :acted_on_type => @object_acted_on.type, :relevancy_value => 1

    # update or create relevancy
        #check if user already has relevancy for category
        if(!current_user.relevancies.select{|relevancy| relevancy.category_id == @object_acted_on.category_id}.empty?)
            # if relevancy found...
            @relevancy = Relevancy.where("user_id = ? AND category_id = ?", current_user.id, @object_acted_on.category_id)[0]  ### should also have check to confirm only 1 result found
            @relevancy.score += @action.relevancy_value
        else
            # if no relevancy found... 
            @relevancy = Relevancy.new :user_id => current_user.id, :category_id => @object_acted_on.category.id, :score => @action.relevancy_value
        end
    @relevancy.save

    # associate action with relevancy then save
    @action.relevancy_id = @relevancy.id
    @action.save
  
    redirect_to @object_acted_on

  end
end


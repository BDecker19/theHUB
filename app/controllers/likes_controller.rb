class LikesController < ApplicationController
 	
  # POST
  def create
    @object_acted_on = params[:acted_on_type].constantize.find(params[:acted_on_id])

    # create new like ###read you're not supposed to overwrite initialize method?
    @like = Like.new
    @like.set_vals({:liker => current_user, :liked => @object_acted_on})
    @like.save

    # create action
    @action = Action.new 
    @action.set_vals({:doer => current_user, :product => @like, :done_to => @object_acted_on, :relevancy_value => 1}) ### relevancy value will become lookup against the action_relevancy_value table

    # update or create relevancy
        #check if user already has relevancy for category
        if(!current_user.relevancies.select{|relevancy| relevancy.category_id == @object_acted_on.category_id}.empty?)
            # if relevancy found...
            @relevancy = Relevancy.where("user_id = ? AND category_id = ?", current_user.id, @object_acted_on.category_id)[0]  ### should also have check to confirm only 1 result found?
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


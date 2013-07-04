class Action < ActiveRecord::Base
  attr_accessible :actor_id, :action_product_id, :action_product_type, :acted_on_id, :acted_on_type, :relevancy_id, :relevancy_value

  belongs_to :actor, :class_name => 'User', :foreign_key => 'actor_id'
  belongs_to :action_product, :foreign_key => 'action_product_id', :polymorphic => true
  belongs_to :acted_on, :foreign_key => 'acted_on_id', :polymorphic => true
  belongs_to :relevancy


	def set_vals (params = {})
	
		### should probably be checks here to ensure all necessary data present and/or that all values set correctly?

		self.actor_id = params[:doer].id
		self.action_product_id = params[:product].id
		self.action_product_type = params[:product].class.to_s
		self.acted_on_id = params[:done_to].id
		self.acted_on_type = params[:done_to].type  #subclass(eg ContentItemArticle), not parent(eg ContentItem). For parent, use ".class.model_name"
		self.relevancy_value = params[:relevancy_value]
	
		# to revert
	end

end

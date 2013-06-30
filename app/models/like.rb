class Like < ActiveRecord::Base

	attr_accessible :liker_id, :liked_id, :liked_type

	belongs_to :liked, :foreign_key => 'liked_id', :polymorphic => true
	belongs_to :liker, :class_name => 'User', :foreign_key => 'liker_id'
	has_one :action, :foreign_key => 'action_product_id'


	def set_vals (params = {})

		### should probably be checks here to ensure all necessary data present and/or that all values set correctly?

		self.liker_id = params[:liker].id
		self.liked_id = params[:liked].id
		self.liked_type = params[:liked].type #subclass(eg ContentItemArticle), not parent(eg ContentItem). For parent, use ".class.model_name"
	end

end

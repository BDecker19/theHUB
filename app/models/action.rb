class Action < ActiveRecord::Base
  attr_accessible :actor_id, :action_product_id, :action_product_type, :acted_on_id, :acted_on_type, :relevancy_id, :relevancy_value

  belongs_to :actor, :class_name => 'User', :foreign_key => 'actor_id'
  belongs_to :action_product, :foreign_key => 'action_product_id', :polymorphic => true
  belongs_to :acted_on, :foreign_key => 'acted_on_id', :polymorphic => true
  belongs_to :relevancy

end

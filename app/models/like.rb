class Like < ActiveRecord::Base
  attr_accessible :liker_id, :liked_id, :liked_type

  belongs_to :liked, :foreign_key => 'liked_id', :polymorphic => true
  belongs_to :liker, :class_name => 'User', :foreign_key => 'liker_id'
  has_one :action, :foreign_key => 'action_product_id'

end

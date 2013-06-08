class Like < ActiveRecord::Base
  attr_accessible :liker_id, :liked_id, :liked_type

  belongs_to :liked, :polymorphic => true
  belongs_to :liker, :class_name => 'User', :foreign_key => 'liker_id'

end

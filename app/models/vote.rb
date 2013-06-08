class Vote < ActiveRecord::Base
  attr_accessible :author_id, :votable_id, :votable_type

  belongs_to :votable, :polymorphic => true
  belongs_to :author, :class_name => 'User'

end

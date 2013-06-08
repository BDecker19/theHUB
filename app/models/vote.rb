class Vote < ActiveRecord::Base
  attr_accessible :author_id, :votable_id, :votable_type

  belongs_to :content_item
  belongs_to :user

end

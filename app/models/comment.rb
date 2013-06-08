class Comment < ActiveRecord::Base
  attr_accessible :author_id, :commentable_id, :commentable_type, :content

  belongs_to :content_item
  belongs_to :user

end

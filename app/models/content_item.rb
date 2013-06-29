class ContentItem < ActiveRecord::Base
  attr_accessible :author_id, :title, :type, :category_id

  has_many :likes, :foreign_key => 'liked_id'
  has_many :actions, :foreign_key => 'acted_on_id'
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :category, :foreign_key => 'category_id'

end
class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :category_items, :foreign_key => 'category_id', :polymorphic => true

end

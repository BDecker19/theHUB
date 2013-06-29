class Relevancy < ActiveRecord::Base
  attr_accessible :category_id, :user_id, :score

  belongs_to :user
  belongs_to :category
  has_many :actions

end

class Vote < ActiveRecord::Base
  attr_accessible :author_id, :votable_id, :votable_type
end

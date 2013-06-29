class ContentItem < ActiveRecord::Base
  attr_accessible :author_id, :title, :type

  has_many :likes, :foreign_key => 'liked_id'
  has_many :actions, :foreign_key => 'acted_on_id'
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  
  class << self
    def new_with_cast(*a,&b)
      if (h = a.first).is_a? Hash and (type = h[:type] || h['type']) and (klass = type.constantize) != self
        raise "Error!!" unless klass < self # klass should be a descendant of User
        return klass.new(h, &b)
      end
      new_without_cast(*a, &b)
    end
    alias_method_chain :new, :cast
  end

end
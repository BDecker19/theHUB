class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :type
  # attr_accessible :title, :body

  has_many :votes
  has_many :content_items

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

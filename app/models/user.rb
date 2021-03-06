class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :type
  # attr_accessible :title, :body

  has_many :likes, :foreign_key => 'liker_id'
  has_many :actions, :foreign_key => 'actor_id'
  has_many :content_items, :foreign_key => 'author_id'
  has_many :relevancies

end

class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :username, :name
  #validates :name, presence: false, length: { maximum: 50 }
  validates :username, presence: true, :uniqueness => true, length: { maximum: 30 }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :activities
  has_many :comments, through: :activities

  def to_param
    username
  end
end



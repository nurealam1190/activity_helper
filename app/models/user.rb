class User < ActiveRecord::Base
	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :username, :name
  #validates :name, presence: false, length: { maximum: 50 }
  validates :username, presence: true, :uniqueness => true, length: { maximum: 30 }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :activities

  def to_param
    username
  end
end



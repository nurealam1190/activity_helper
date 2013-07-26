class Friendship < ActiveRecord::Base
	attr_accessible :friend_id
	attr_accessible :status
	
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	has_many :messages

	validates :user_id, presence: true
	validates :friend_id, presence: true
	

	
end

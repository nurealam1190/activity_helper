class Message < ActiveRecord::Base
	attr_accessible :message
	attr_accessible :recipient_id
	attr_accessible :user_id
	attr_accessible :status

	belongs_to :friendship
	validates :message, presence: true, length: {minimum: 2}
	validates :recipient_id, presence: true
	validates :user_id, presence: true
	

	
	default_scope order: 'messages.created_at DESC'
	belongs_to :recipients, class_name: "User"
	belongs_to :user
end

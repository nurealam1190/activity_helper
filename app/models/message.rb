class Message < ActiveRecord::Base
	attr_accessible :message
	attr_accessible :friendship_id

	belongs_to :friendship
	validates :message, presence: true
	validates :friendship_id, presence: true
	default_scope order: 'messages.created_at DESC'
end

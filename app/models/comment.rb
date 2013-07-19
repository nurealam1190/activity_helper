class Comment < ActiveRecord::Base
	attr_accessible :content
	validates :content, presence: true, length: { maximum: 200 }
	validates :user_id, presence: true
	validates :activity_id, presence: true
	belongs_to :user
	belongs_to :activity
	default_scope order: 'comments.created_at DESC'

end

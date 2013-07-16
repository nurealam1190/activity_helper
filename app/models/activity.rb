class Activity < ActiveRecord::Base
	attr_accessible :category, :description, :name  
    validates :user_id, presence: true
    validates :description, presence: true, length: { maximum: 200}
    validates :name, presence: true
    validates :category, presence: true
	belongs_to :user
	default_scope order: 'activities.created_at DESC'
end

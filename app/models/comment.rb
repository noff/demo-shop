class Comment < ActiveRecord::Base
  attr_accessible :message, :item_id
	belongs_to :item
	belongs_to :user
	validates :message, :item_id, :user_id, :presence => true
end

class ItemOrder < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
	validates :order_id, :presence => true

	include ActiveModel::Validations
	validates_with ItemValidator

end

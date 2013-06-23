class Order < ActiveRecord::Base
  attr_accessible :address
	belongs_to :user
	has_many :item_orders

	include ActiveModel::Validations
	validates_with UserValidator

	# Отметить заказ как оплаченный
	def mark_as_paid
		update_attribute :paid, true
	end

end

class ItemUser < ActiveRecord::Base
  attr_accessible :item_id, :quantity
	belongs_to :item
	belongs_to :user
	validates :user_id, :item_id, :quantity, :numericality => { :greater_than => 0, :only_integer => true }

	include ActiveModel::Validations
	validates_with UserValidator
	validates_with ItemValidator



	# Стоимость текущей корзины пользователя
	# @param [User] user Объект пользователя
	# @return Fixnum
	def self.total_sum_for(user)
		total = 0
		item_users = user.item_users
		item_users.each do |item_user|
			total += item_user.quantity * item_user.item.price
		end
		total
	end


end

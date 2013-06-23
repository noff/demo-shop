class Order < ActiveRecord::Base
  attr_accessible :address
	belongs_to :user
	has_many :item_orders

	include ActiveModel::Validations
	validates_with UserValidator

end

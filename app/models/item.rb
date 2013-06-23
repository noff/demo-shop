class Item < ActiveRecord::Base
  attr_accessible :name, :description, :price, :category_id, :photo

	validates :name, :presence => true
	validates :price, :presence => true
	validates :price, :numericality => { :greater_than => 0, :only_integer => true }

	belongs_to :category
	has_many :comments
	has_many :item_users
	has_many :item_orders

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/:style/missing.png"

end

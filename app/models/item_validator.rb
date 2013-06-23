class ItemValidator < ActiveModel::Validator

	def validate(record)
		begin
			Item.find(record.item_id)
		rescue
			record.errors[:item_id] << 'not found'
		end
	end

end
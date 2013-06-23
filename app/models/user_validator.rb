class UserValidator < ActiveModel::Validator

	def validate(record)
		begin
			User.find(record.user_id)
		rescue
			record.errors[:user_id] << 'not found'
		end
	end

end
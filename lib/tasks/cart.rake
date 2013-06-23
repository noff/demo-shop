namespace :cart do


	desc "Clean old elements from cart"
  task :cleanup_old_cart_elements => :environment do
		ItemUser.clean_old_records
		puts 'Cleanup Done'
  end

end

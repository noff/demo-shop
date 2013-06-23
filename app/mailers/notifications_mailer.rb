# coding: utf-8
class NotificationsMailer < ActionMailer::Base
  default from: "test@test.com"


	def order_created(order)
		@order = order
		mail(:to => order.user.email, :subject => "Ваш Заказ").deliver
	end


end

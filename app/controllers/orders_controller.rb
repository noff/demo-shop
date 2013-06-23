class OrdersController < ApplicationController

	before_filter :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end


  # POST /orders
  # POST /orders.json
  def create

		# Получаем корзину и убеждаемся, что в ней что-то есть.
		# Если ничего нет, возвращаемся обратно с ошибкой "Нефиг"
		# Если есть, то
		# 	Создаем заказ.
		#		Если получилось сохранить заказ, то ...
		#			Перебрасываем записи из корзины в ItemOrder[s] по order_id
		#			Очищаем корзину
		#		...если не получилось сохранить заказ
		#			Уходим обратно с ошибкой

		item_users = current_user.item_users
		if item_users.any?

			order = Order.new(params[:order])
			order.user_id = current_user.id
			order.sum = ItemUser.total_sum_for current_user

			# Пытаемся создать заказ
			if order.save

				# Переносим данные из корзины в информацию о заказе
				item_users.each do |item_user|
					item_order = ItemOrder.new
					item_order.item_id = item_user.item_id
					item_order.quantity = item_user.quantity
					item_order.price = item_user.item.price
					order.item_orders << item_order
				end

				# Чистим корзину
				item_users.destroy_all

				
				# Пишем юзеру письмо
				#NotificationsMailer.order_created order

				redirect_to orders_path, notice: 'Order was successfully created.'
			else
				redirect_to :back, :alert => 'Could not create order'
			end

		else

			redirect_to :back, :alert => 'Your cart is empty'

		end

  end



  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
		if @order.user_id == current_user.id
			@order.destroy
		end
		redirect_to orders_url
  end
end

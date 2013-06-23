class PaymentsController < ApplicationController

	def success
		raise params.inspect
  end

  def cancel
  end

  def notify

		filtered_params = params
		filtered_params.delete(:action)
		filtered_params.delete(:controller)
		filtered_params[:cmd] = '_notify-validate'

		# Проверяем, от кого пришел ответ - точно от PayPal или нет
		response = Faraday.post 'https://www.paypal.com/cgi-bin/webscr', filtered_params
		response_body = response.body

		# Если удалось, то сохраняем операцию как обработанную, иначе как не обработанную
		if response_body == 'VERIFIED'

			# Ищем заказ
			order = Order.find params[:item_number].to_i

			if params[:receiver_email] != 'noff@mkechinov.ru'
				raise "PAYPAL: Receiver email '#{params[:receiver_email]}' do not equal our email 'noff@mkechinov.ru'"
			end

			if params[:txn_type] != 'web_accept'
				raise "PAYPAL: txn_type is not 'web_accept'"
			end

			if params[:mc_gross].to_f < order.sum || params[:mc_currency] != 'USD'
				raise "PAYPAL: Paymend sum '#{params[:mc_gross]}' and currency '#{params[:mc_currency]}'"
			end

			# Отмечаем оплаченным
			order.mark_as_paid

		else
			raise "PAYPAL: PayPal said '#{response_body}' for query"
		end


		render :text => 'OK'

	end

end

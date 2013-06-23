class ItemUsersController < ApplicationController

	before_filter :authenticate_user!

  def index
    @item_users = current_user.item_users
		@order = Order.new
  end


  def create

		# Пытаемся найти такую запись в корзине
		item_user = ItemUser.find_by_item_id_and_user_id params[:item_user][:item_id], current_user.id

		# Если такой записи нет, то создаем, иначе увеличиваем количество на 1
		if item_user.nil?
			item_user = ItemUser.new(params[:item_user])
			item_user.user_id = current_user.id
		else
			item_user.quantity += 1
		end

		# Пытаюсь сохранить и отредиректить пользователя
		if item_user.save
			redirect_to :back, notice: 'Item user was successfully created.'
		else
			redirect_to :back
		end
  end


  def destroy
    @item_user = ItemUser.find(params[:id])
		if @item_user.user_id == current_user.id
			@item_user.destroy
		end
		redirect_to item_users_url
  end
end

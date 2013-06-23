class CommentsController < ApplicationController

	before_filter :authenticate_user!

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id

		@item = Item.find @comment.item_id

		if @comment.save
			redirect_to @item, notice: 'Comment was successfully created.'
		else
			redirect_to @item, alert: 'Some problems with your comment'
		end

end




  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy

		comment = Comment.find(params[:id])
		item = comment.item

		if current_user.id == comment.user_id
			comment.destroy
		end

		redirect_to item

  end
end

class Admin::ItemCommentsController < ApplicationController
  
  def destroy
    @item_comment = ItemComment.find(params[:id])
    @item = @item_comment.item # アイテムを取得

    @item_comment.destroy
  end 

  private

    def item_comment_params
      params.require(:item_comment).permit(:comment)
    end
end

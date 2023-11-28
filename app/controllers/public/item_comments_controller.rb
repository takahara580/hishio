class Public::ItemCommentsController < ApplicationController
  def create
    # アイテムを検索
    @item = Item.find(params[:item_id])

    # 新しいコメントを作成
    @item_comment = current_customer.item_comments.new(item_comment_params)
    @item_comment.item = @item
    @item_comment.save
    # redirect_to request.referer
  end

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

class Public::ItemCommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item_comment = current_customer.item_comments.new(item_comment_params)
    @item_comment.item = @item
    @item_comment.save
  end

def destroy
  @item_comment = ItemComment.find(params[:id])
  @item = @item_comment.item

  @item_comment.destroy
end 

private

def item_comment_params
   params.require(:item_comment).permit(:comment)
end
end

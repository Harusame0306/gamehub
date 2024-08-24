class PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)  
  end

  def destroy
    Rails.logger.debug "params: #{params.inspect}"
    post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    if post_comment
      post_comment.destroy
      flash[:notice] = "コメントが削除されました。"
    else
      flash[:alert] = "コメントが見つかりませんでした。"
    end
    redirect_to post_path(params[:post_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end

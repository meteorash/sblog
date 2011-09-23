class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(current_user)

    @comment = @post.comments.create(params[:comment])
    @comment.user_id = @user.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end

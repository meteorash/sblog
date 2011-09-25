class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(current_user)

    @comment = @post.comments.create(params[:comment])
    @comment.user_id = @user.id
    @comment.save
  #  redirect_to post_path(@post)

    respond_to do |format|
      format.html  {redirect_to post_path(@post)}# show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html  # show.html.erb
      format.xml  { render :xml => @post }
      format.js
    end
  end

end

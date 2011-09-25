class PostsController < ApplicationController
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html  # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def create
    @post = Post.new(params[:post])
    @user = User.find(current_user)
    @post.user_id = @user.id
    @post.likes = 0

    respond_to do |format|
      if @post.save
        format.html  { redirect_to(@post,
                      :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post,
                      :status => :created, :location => @post }
  #      format.js
      else
        format.html  { render :action => "new" }
        format.xml  { render :xml => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @post.likes = @post.likes + 1
    @post.save

    respond_to do |format|
      format.html  # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html  { redirect_to(@post,
                      :notice => 'Post was successfully updated.') }
        format.xml  { render :xml => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.xml  { render :xml => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html  # show.html.erb
      format.xml  { render :xml => @post }
      format.js
    end
  end

 # def like
 #   @post = Post.find(param[:id])
 #   @post.likes = @post.likes + 1
 #   @post.save
 # end
end

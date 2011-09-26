require 'spec_helper'

describe Post do
  before(:each) do
    @user = Factory(:user)
    #@attr = Factory(:post)
    @attr = { :title => "random title yet again, it only has to be so long",
              :content => "some random content for the article that is to be published soon on the sblog! website, it has to be really long considering the minimum limit" }
  end

  it "should create a new instance given valid attributes" do
    @user.posts.create!(@attr)
  end

  describe "user associations" do
    before(:each) do
      @post1 = Factory(:post, :user => @user, :created_at => 1.day.ago)
      @post2 = Factory(:post, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have a user attribute" do
      @post1.should respond_to(:user)
      @post2.should respond_to(:user)
    end

    it "should have the right associated user" do
      @post1.user_id.should == @user.id
      @post1.user.should == @user
      @post2.user_id.should == @user.id
      @post2.user.should == @user
    end

    it "should have the posts in the right order" do
      @user.posts.should == [@post2, @post1]
    end
  end

    describe "comment associations" do
     @attr = Factory(:comment)

    before(:each) do
      @post = Post.create(@attr)
    end

    it "should have a comments attribute" do
      @post.should respond_to(:comments)
    end

    it "should destroy all associated comments" do
      @post.destroy
      @post.comments.each do |comment|
        Comment.find_by_id(comment.id).should be_nil
      end
    end
    end

  describe "validations" do
    it "should require a user id" do
      User.new(@attr).should_not be_valid
    end

    it "should require non blank title and content" do
      @user.posts.build(:content => "  ", :title => " ").should_not be_valid
    end

    it "should reject content longer than 2000 char" do
      @user.posts.build(:content => "a" * 2001).should_not be_valid
    end

    it "should reject content shorter than 100 char" do
      @user.posts.build(:content => "a" * 99).should_not be_valid
    end
  end
end

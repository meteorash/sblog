require 'spec_helper'

describe User do
   describe "post associations" do
     @attr = Factory(:post)

    before(:each) do
      @user = User.create(@attr)
    end

    it "should have a posts attribute" do
      @user.should respond_to(:posts)
    end

    it "should destroy all associated posts" do
      @user.destroy
      @user.posts.each do |post|
        Post.find_by_id(post.id).should be_nil
      end
    end
   end

  describe "comment associations" do
     @attr = Factory(:comment)

    before(:each) do
      @user = User.create(@attr)
    end

    it "should have a comments attribute" do
      @user.should respond_to(:comments)
    end

    it "should destroy all associated comments" do
      @user.destroy
      @user.comments.each do |comment|
        Comment.find_by_id(comment.id).should be_nil
      end
    end
  end
end

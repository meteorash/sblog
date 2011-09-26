require 'spec_helper'

describe Comment do
  before(:each) do
    @post = Factory(:post)
    @attr = { :body => "random title yet again, it only has to be so long"}
  end

  it "should create a new instance given valid attributes" do
    @post.comments.create!(@attr)
  end

  describe "post associations" do

    before(:each) do
  #    @comment = @post.comments.create(@attr)
      @comment1 = Factory(:comment, :post => @post, :created_at => 1.day.ago)
      @comment2 = Factory(:comment, :post => @post, :created_at => 1.hour.ago)
    end

    it "should have a post attribute" do
      @comment1.should respond_to(:post)
      @comment2.should respond_to(:post)
    end

    it "should have the right associated post" do
      @comment1.post_id.should == @post.id
      @comment1.post.should == @post
      @comment2.post_id.should == @post.id
      @comment2.post.should == @post
    end

    it "should have comments in the right order" do
      @post.comments.should == [@comment2, @comment1]
    end
  end

  describe "validations" do
    it "should require a post id" do
      Post.new(@attr).should_not be_valid
    end

    it "should require a user id" do
      User.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @post.comments.build(:body => "  ").should_not be_valid
    end

    it "should reject content longer than 100 char" do
      @post.comments.build(:body => "a" * 101).should_not be_valid
    end

    it "should reject content shorter than 10 char" do
      @post.comments.build(:body => "a" * 9).should_not be_valid
    end
  end
end

require 'spec_helper'

describe PostsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  #describe "GET 'edit'" do
  #  it "should be successful" do
  #    get 'edit'
  #    response.should be_success
  #  end
  #end
  #
  #render_views
  #
  #describe "GET 'show'" do
  #  before(:each) do
  #    @post = Factory(:post)
  #  end
  #
  #  it "should be successful" do
  #    get 'show'
  #    response.should be_success
  #  end
  #
  #  it "should show the post's comments" do
  #    comment1 = Factory(:comment, :post => @post, :body => "some random comments here displayed")
  #    comment2 = Factory(:comment, :post => @post, :body => "other random comments not displayed")
  #    get :show, :id => @post
  #    response.should have_selector("span.comment", :body => comment1.body)
  #    response.should have_selector("span.comment", :body => comment2.body)
  #  end
  #end
end

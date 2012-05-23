require 'spec_helper'

describe Post do
  before :all do
    @user = User.create :email => "example@example.com", :password => "password",
                        :password_confirmation => "password",
                        :fullname => "Sample user",
                        :description => "Sample description"
    @blog = Blog.create :title => "Title", :description => "Description" do |b|
      b.user = @user
    end
  end

  context "with given initialized object" do
    before :each do
      @post = Post.new :content => "Lorem ipsum"
      @post.user = @user
      @post.blog = @blog
    end

    [:user, :blog, :content].each do |field|
      context "##{field}" do
        it "should be a method" do
          lambda do
            @post.method field
          end.should_not raise_error NameError
        end

        it "should not return nil" do
          @post.send(field).should_not be_equal nil
        end
      end
    end
  end

  context "with given attributes" do
    before :each do
      @hash = {
        :content => "Lorem ipsum",
      }
    end

    describe "#new" do
      it "should initialize new object" do
        Post.new(@hash) do |p|
          p.user = @user
          p.blog = @blog
        end.should_not be_equal nil
      end

      it "should create valid object" do
        Post.new(@hash) do |p|
          p.user = @user
          p.blog = @blog
        end.should be_valid
      end

      it "should fail without content" do
        Post.new do |p|
          p.user = @user
          p.blog = @blog
        end.should_not be_valid
      end

      it "should fail without user" do
        Post.new(@hash) do |p|
          p.blog = @blog
        end.should_not be_valid
      end

      it "should fail without blog" do
        Post.new(@hash) do |p|
          p.user = @user
        end.should_not be_valid
      end
    end

    describe "#create" do
      it "should return an object" do
        Post.create(@hash) do |p|
          p.user = @user
          p.blog = @blog
        end.should_not be_nil
      end

      it "should save the post" do
        Post.create(@hash) do |p|
          p.user = @user
          p.blog = @blog
        end.id.should_not be_nil
      end

      it "should fail without content" do
        Post.create do |p|
          p.user = @user
          p.blog = @blog
        end.id.should be_nil
      end

      it "should fail without user" do
        Post.create(@hash) do |p|
          p.blog = @blog
        end.id.should be_nil
      end

      it "should fail without blog" do
        Post.create(@hash) do |p|
          p.user = @user
        end.id.should be_nil
      end
    end
  end

  after :all do
    User.all.each(&:destroy)
    Blog.all.each(&:destroy)
    Post.all.each(&:destroy)
  end
end


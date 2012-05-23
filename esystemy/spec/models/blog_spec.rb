require 'spec_helper'

describe Blog do
  before :all do
    @user = User.create :email => "example@example.com", :password => "password",
                        :password_confirmation => "password",
                        :fullname => "Sample user",
                        :description => "Sample description"
  end

  context "with given initialized object" do
    before :each do
      @blog = Blog.new :title => "Blog", :description => "Lorem ipsum" do |b|
        b.user = @user
      end
    end

    [:user, :posts, :title, :description].each do |field|
      context "##{field}" do
        it "should be a method" do
          lambda do
            @blog.method field
          end.should_not raise_error NameError
        end

        it "should not return nil" do
          @blog.send(field).should_not be_equal nil
        end
      end
    end
  end

  context "with given attributes" do
    before :each do
      @hash = {
        :title => "Blog",
        :description => "Lorem ipsum"
      }
    end

    describe "#new" do
      it "should initialize new object" do
        Blog.new(@hash).should_not be_equal nil
      end

      it "should create valid object" do
        Blog.new(@hash).should be_valid
      end
    end

    describe "#create" do
      it "should return an object" do
        Blog.create(@hash) do |b|
          b.user = @user
        end.should_not be_nil
      end

      it "should save the post" do
        Blog.create(@hash) do |b|
          b.user = @user
        end.id.should_not be_nil
      end

    end
  end

  after :all do
    User.all.each(&:destroy)
    Blog.all.each(&:destroy)
  end

end


require 'spec_helper'

describe User do

  describe "with given initialized object" do
    before :each do
      @user = User.new :email => "example@example.com", :password => "password",
                       :password_confirmation => "password",
                       :fullname => "Sample user",
                       :description => "Sample description"
    end

    [
      :password, :password_confirmation, :remember_me, :blogs, :posts, :feed,
      :relationships, :followed_users, :reverse_relationships, :followers,
      :following?, :follow!, :unfollow!
    ].each do |field|
      it "should have ##{field} method" do
        lambda do
          @user.method field
        end.should_not raise_error NameError
      end
    end

    [:email, :fullname, :description].each do |field|
      context "##{field}" do
        it "should be a method" do
          lambda do
            @user.method field
          end.should_not raise_error NameError
        end

        it "should not return nil" do
          @user.send(field).should_not be_equal nil
        end
      end
    end
  end

  describe "with given attributes" do
    before :all do
      @hash = {
        :email => "example@example.com",
        :password => "password",
        :password_confirmation => "password",
        :fullname => "Sample user",
        :description => "Sample description"
      }
    end

    describe "#new" do
      it "should initialize new object" do
        User.new(@hash).should_not be_equal nil
      end

      it "should create valid object" do
        User.new(@hash).should be_valid
      end
    end

    describe "#create" do
      it "should return an object" do
        User.create(@hash).should_not be_nil
      end

      it "should save the user" do
        User.create(@hash).id.should_not be_nil
      end
    end
  end

  after :all do
    User.all.each(&:destroy)
  end

end

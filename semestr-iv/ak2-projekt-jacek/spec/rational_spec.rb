require 'spec_helper'

describe "Rational" do

  it "should create new object" do
    RTest.new(3).should_not be_equal nil
  end

  it "should return +infinity" do
    RTest.new(0, 3, 0).to_f.should == 3.0/0
  end

  it "should return -infinity" do
    RTest.new(1, 3, 0).to_f.should == -3.0/0
  end

  it "should return proper value" do
    RTest.new(0, 3, 1).to_f.should == 3.0
    RTest.new(0, 1, 2).to_f.should == 0.5
    RTest.new(1, 1, 2).to_f.should == -0.5
  end

  it "should be comparable" do
    RTest.new(0, 3, 1).should >= RTest.new(0, 2, 1)
    RTest.new(2.5).should == RTest.new(0, 5, 2)
    RTest.new(1, 5, 1).should_not == 5
  end

  describe "small values" do
    describe "addition" do
      it "should return positive in result of addition of positive numbers" do
        a = RTest.new 0, 1, 2
        b = RTest.new 0, 1, 2
        (a+b).to_f.should == 1.0
      end

      it "should return zero in result of addition of opposite numbers" do
        a = RTest.new 1, 1, 2
        b = RTest.new 0, 1, 2
        (a+b).to_f.should == 0.0

        a = RTest.new 0, 1, 2
        b = RTest.new 1, 1, 2
        (a+b).to_f.should == 0.0
      end

      it "should return negative in result of addition of negative numbers" do
        a = RTest.new 1, 1, 2
        b = RTest.new 1, 1, 2
        (a+b).to_f.should == -1.0
      end
    end

    describe "subtraction" do
      it "should return 0 when substracting equal positive values" do
        a = RTest.new 0, 1, 2
        b = RTest.new 0, 1, 2
        (a-b).to_f.should == 0.0
      end

      it "should return negative value when subtracting positive number from
          negative number" do
        a = RTest.new 1, 1, 2
        b = RTest.new 0, 1, 2
        (a-b).to_f.should == -1.0
      end

      it "should return positive value when subtracting negative number from
          positive number" do
        a = RTest.new 0, 1, 2
        b = RTest.new 1, 1, 2
        (a-b).to_f.should == 1.0
      end

      it "should return 0 when substracting equal negative values" do
        a = RTest.new 1, 1, 2
        b = RTest.new 1, 1, 2
        (a-b).to_f.should == 0.0
      end
    end

    describe "multiplication" do
      it "should return positive in result of multiplying positive values" do
        a = RTest.new 0, 1, 2
        b = RTest.new 0, 1, 2
        (a*b).to_f.should == 1.0/4
      end

      it "should return negative in result of multiplying values with opposite
          signs" do
        a = RTest.new 1, 1, 2
        b = RTest.new 0, 1, 2
        (a*b).to_f.should == -1.0/4

        a = RTest.new 0, 1, 2
        b = RTest.new 1, 1, 2
        (a*b).to_f.should == -1.0/4
      end

      it "should return positive in result of multiplying negative values" do
        a = RTest.new 1, 1, 2
        b = RTest.new 1, 1, 2
        (a*b).to_f.should == 1.0/4
      end
    end

    describe "division" do
      it "should return positive when dividing two positive numbers" do
        a = RTest.new 0, 1, 2
        b = RTest.new 0, 1, 2
        (a/b).to_f.should == 1.0
      end

      it "should return negative when dividing two numbers with opposite
          signs" do
        a = RTest.new 1, 1, 2
        b = RTest.new 0, 1, 2
        (a/b).to_f.should == -1.0

        a = RTest.new 0, 1, 2
        b = RTest.new 1, 1, 2
        (a/b).to_f.should == -1.0
      end

      it "should return positive when dividing two negative numbers" do
        a = RTest.new 1, 1, 2
        b = RTest.new 1, 1, 2
        (a/b).to_f.should == 1.0
      end
    end
  end

  describe "average values" do
    before :each do
      @delta = 10**-12
    end

    describe "addition" do
      it "should return positive in result of addition of positive numbers" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 0, 23423, 23
        (a+b).to_f.should be_within(@delta).of 34.0/3243 + 23423.0/23
      end

      it "should return appropriate value when adding positive number to
          negative number" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 0, 23423, 23
        (a+b).to_f.should be_within(@delta).of -34.0/3243 + 23423.0/23
      end

      it "should return appropriate value when adding negative number to
          positive number" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 1, 23423, 23
        (a+b).to_f.should be_within(@delta).of 34.0/3243 + -23423.0/23
      end

      it "should return negative in result of addition of negative numbers" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 1, 23423, 23
        (a+b).to_f.should be_within(@delta).of -34.0/3243 + -23423.0/23
      end
    end

    describe "subtraction" do
      it "should return appropriate value when subtracting positive numbers" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 0, 23423, 23
        (a-b).to_f.should be_within(@delta).of 34.0/3243 - 23423.0/23
      end

      it "should return appropriate value when subtracting positive number
          from negative number" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 0, 23423, 23
        (a-b).to_f.should be_within(@delta).of -34.0/3243 - 23423.0/23
      end

      it "should return appropriate value when subtracting negative number
          from positive number" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 1, 23423, 23
        (a-b).to_f.should be_within(@delta).of 34.0/3243 - -23423.0/23
      end

      it "should return appropriate value when subtracting negative numbers" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 1, 23423, 23
        (a-b).to_f.should be_within(@delta).of -34.0/3243 - -23423.0/23
      end
    end

    describe "multiplication" do
      it "should return appropriate value when multiplying two positive
          numbers" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 0, 23423, 23
        (a*b).to_f.should be_within(@delta).of (34.0/3243) * (23423.0/23)
      end

      it "should return appropriate value when multiplying positive number by
          negative number" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 0, 23423, 23
        (a*b).to_f.should be_within(@delta).of (-34.0/3243) * (23423.0/23)
      end

      it "should return appropriate value when multiplying negative number by
          positive numbers" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 1, 23423, 23
        (a*b).to_f.should be_within(@delta).of (34.0/3243) * (-23423.0/23)
      end

      it "should return appropriate value when multiplying two negative
          numbers" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 1, 23423, 23
        (a*b).to_f.should be_within(@delta).of (-34.0/3243) * (-23423.0/23)
      end
    end

    describe "division" do
      it "should return appropriate value when dividing two positive numbers" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 0, 23423, 23
        (a/b).to_f.should be_within(@delta).of (34.0/3243) / (23423.0/23)
      end

      it "should return appropriate value when dividing negative number by
          positive number" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 0, 23423, 23
        (a/b).to_f.should be_within(@delta).of (-34.0/3243) / (23423.0/23)
      end

      it "should return appropriate value when dividing positive number by
          negative number" do
        a = RTest.new 0, 34, 3243
        b = RTest.new 1, 23423, 23
        (a/b).to_f.should be_within(@delta).of (34.0/3243) / (-23423.0/23)
      end

      it "should return appropriate value when dividing two negative numbers" do
        a = RTest.new 1, 34, 3243
        b = RTest.new 1, 23423, 23
        (a/b).to_f.should be_within(@delta).of (-34.0/3243) / (-23423.0/23)
      end
    end
  end

  describe "big values" do
    before :each do
      @delta = 10**-8
    end

    describe "addition" do
      it "should return correct value within delta" do
        a = RTest.new 0, 21474836, 1
        1000.step 10000000, 1000 do |i|
          b = RTest.new 0, i*123, 1
          (a+b).to_f.should be_within(@delta).of 21474836.0 + 1.0*i*123
        end
      end
    end

    describe "subtraction" do
      it "should return correct value within delta" do
        a = RTest.new 0, 21474836, 1
        1000.step 10_000, 1000 do |i|
          b = RTest.new 0, i, 1
          (a-b).to_f.should be_within(@delta).of 21474836.0 - 1.0*i
        end
      end
    end

    describe "multiplication" do
      it "should return correct value within delta" do
        a = RTest.new 0, 21474836, 1
        1000.step 10_000, 1000 do |i|
          b = RTest.new 0, i, 1
          (a*b).to_f.should be_within(@delta).of 21474836.0 * 1.0*i
        end
      end
    end

    describe "division" do
      it "should return correct value within delta" do
        a = RTest.new 0, 21474836, 1
        1000.step 10_000, 1000 do |i|
          b = RTest.new 0, i, 1
          (a/b).to_f.should be_within(@delta).of 21474836.0 / 1.0*i
        end
      end
    end
  end
end


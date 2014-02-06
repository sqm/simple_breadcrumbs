require 'spec_helper'
require 'has_breadcrumb'

describe HasBreadcrumb do
  let(:admin){ Admin.create }
  let(:manager) { Manager.create }
  let(:user){ User.create }
  let(:intern) { Intern.create }

  describe ".has_breadcrumb" do
    describe ".breadcrumb_parent" do
      it "should return nil if options[:parent].nil?" do
        admin.breadcrumb_parent.should == nil
      end

      it "should define a breadcrumb parent if one is given" do
        user.manager = manager
        user.breadcrumb_parent.should == manager
      end
    end

    describe ".breadcrumb_name" do
      it "should return an empty string if no params[:title] is given" do
        intern.breadcrumb_name.should == ""
      end

      it "should return a title when a Symbol is passed" do
        intern.name = "Joe"
        intern.breadcrumb_name.should == ""
      end

      it "should return a title when a string is passed" do
        admin.breadcrumb_name.should == "Admin"
      end
    end
  end

  describe "#included" do
    it "should respond to has_breadcrumb" do
      Admin.should respond_to(:has_breadcrumb)
    end
  end
end

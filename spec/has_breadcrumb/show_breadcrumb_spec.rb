require 'spec_helper'

module ShowBreadcrumb
  extend self
end

describe ShowBreadcrumb do
  let(:admin) { Admin.create(:name => "Admins") }
  let(:manager) { Manager.create(:name => "Managers") }
  let(:user) { User.create(:name => "Users") }
  let(:controller) { ActionController::Base.new }

  describe ".breadcrumbs" do
    context "when :forced_parent is passed" do
      it "should link to the forced parent" do
        controller.stub(:url_for => "fake_url")
        controller.breadcrumb(user, "Add", :forced_parent => admin).should == "<a href=\"fake_url\">Admin</a> &gt; <a href=\"fake_url\">Users</a> &gt; Add User"
      end
    end

    context "when there is only one crumb" do
      it "should not return a parent link" do
        controller.stub(:url_for => "fake_url")
        controller.breadcrumb(admin, "Add").should == "<a href=\"fake_url\">Admins</a> &gt; <a href=\"fake_url\">Admin</a> &gt; Add Admin"
      end
    end
  end

  describe ".lookup_breadcrumb" do
    context "when an object has no parent" do
      it "should return an array containing itself" do
        ShowBreadcrumb.lookup_breadcrumb(admin, []).should == [admin]
      end
    end

    context "when an object has a parent" do
      it "should return an array with itself and parents" do
        user.manager = manager
        ShowBreadcrumb.lookup_breadcrumb(user, []).should == [user, manager]
      end
    end
  end
end

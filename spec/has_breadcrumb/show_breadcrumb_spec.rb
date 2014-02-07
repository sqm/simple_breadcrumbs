require 'spec_helper'

class ObjectWithBreadcrumb
  include ShowBreadcrumb
end

describe ShowBreadcrumb do
  let(:admin) { Admin.create(name: "Admins") }
  let(:manager) { Manager.create(name: "Managers") }
  let(:user) { User.create(name: "Users") }
  let(:controller) { ActionController::Base.new }

  describe "#collect_crumbs" do
    subject(:object_with_breadcrumb) { ObjectWithBreadcrumb.new }

    context "when an object has no parent" do
      it "should return an array containing itself" do
        crumbs = object_with_breadcrumb.collect_crumbs(admin, [])
        expect(crumbs).to eq([admin])
      end
    end

    context "when an object has a parent" do
      it "should return an array with itself and parents" do
        user.manager = manager
        crumbs = object_with_breadcrumb.collect_crumbs(user, [])
        expect(crumbs).to eq([user, manager])
      end
    end
  end

  describe "#breadcrumbs" do
    before { controller.stub(url_for: "fake_url") }

    context "when :forced_parent is passed" do
      it "should link to the forced parent" do
        breadcrumb = controller.breadcrumb(user, "Add", forced_parent: admin)
        expect(breadcrumb).to eq("<a href=\"fake_url\">Admin</a> &gt; <a href=\"fake_url\">Users</a> &gt; Add User")
      end
    end

    context "when there is only one crumb" do
      it "should not return a parent link" do
        breadcrumb = controller.breadcrumb(admin, "Add")
        expect(breadcrumb).to eq("<a href=\"fake_url\">Admins</a> &gt; <a href=\"fake_url\">Admin</a> &gt; Add Admin")
      end
    end
  end
end

require 'spec_helper'
require 'has_breadcrumb'

class Father
  include HasBreadcrumb

  has_breadcrumb title: "Father"
end

class Son
  include HasBreadcrumb

  attr_accessor :father, :name

  has_breadcrumb parent: :father, title: :name
end

class Daughter
  include HasBreadcrumb

  attr_reader :father

  has_breadcrumb parent: :father
end

describe HasBreadcrumb do
  let(:father){ Father.new }
  let(:son){ Son.new }
  let(:daughter) { Daughter.new }

  describe "#breadcrumb_parent" do
    context "when the parent is nil" do
      it "should return nil" do
        expect(father.breadcrumb_parent).to eq(nil)
      end
    end

    context "when a parent is given" do
      it "should define a breadcrumb parent" do
        father = Object.new
        son.father = father
        expect(son.breadcrumb_parent).to eq(father)
      end
    end
  end

  describe "#breadcrumb_name" do
    context "when no title is given" do
      it "should return an empty string" do
        expect(daughter.breadcrumb_name).to eq("")
      end
    end

    context "when a name is given" do
      it "should return a title when a Symbol is passed" do
        son.name = "Jimmy"
        expect(son.breadcrumb_name).to eq("Jimmy")
      end

      it "should return a title when a string is passed" do
        expect(father.breadcrumb_name).to eq("Father")
      end
    end
  end

  describe ".included" do
    it "should respond to has_breadcrumb" do
      Father.should respond_to(:has_breadcrumb)
    end
  end
end

class Intern < ActiveRecord::Base
  belongs_to :manager

  has_breadcrumb :parent => :manager #, :title => :name
end

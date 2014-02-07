class Admin < ActiveRecord::Base
  has_many :managers

  has_breadcrumb :title => 'Admin'
end

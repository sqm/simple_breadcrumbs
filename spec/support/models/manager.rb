class Manager < ActiveRecord::Base
  belongs_to :admin
  has_many :users, :foreign_key => :admin_id

  has_breadcrumb :parent => :admin, :title => :name
end

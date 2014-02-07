require "has_breadcrumb/version"
require "has_breadcrumb/has_breadcrumb.rb"
require "has_breadcrumb/show_breadcrumb.rb"

ActiveRecord::Base.class_eval { include HasBreadcrumb }
ActionView::Base.class_eval { include ShowBreadcrumb }

require "has_breadcrumb/version"
require "has_breadcrumb/has_breadcrumb.rb"
require "has_breadcrumb/show_breadcrumb.rb"

ActiveSupport.on_load(:active_record) do
  include HasBreadcrumb
end

ActiveSupport.on_load(:action_controller) do
  include ActionView::Helpers
  include ShowBreadcrumb
end

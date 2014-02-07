module HasBreadcrumb
  class Railtie < Rails::Railtie
    config.before_initialize do
      ActiveRecord::Base.class_eval { include HasBreadcrumb }
      ActionView::Base.class_eval { include ShowBreadcrumb }
    end
  end
end

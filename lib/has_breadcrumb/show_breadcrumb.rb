module ShowBreadcrumb
  # Recursive function to lookup through parent breadcrumbs
  def lookup_breadcrumb(obj, crumbs)
    crumbs << obj
    crumbs = lookup_breadcrumb(obj.breadcrumb_parent, crumbs) unless obj.breadcrumb_parent.nil?
    crumbs
  end

  # View helper to generate breadcrumbs
  def breadcrumb(obj, action = nil, options = {})
    crumb_html = ""
    crumbs = Array.new
    crumbs = lookup_breadcrumb(obj, crumbs)

    if options.has_key?(:forced_parent)
      crumb_link = url_for :controller => options[:forced_parent].class.to_s.underscore.pluralize, :action => "show", :id => options[:forced_parent].id
      crumb_html = link_to options[:forced_parent].breadcrumb_name, crumb_link
    elsif crumbs.length == 1
      crumb_link = url_for :controller => obj.class.to_s.underscore.pluralize
      crumb_html = link_to obj.class.model_name.human.pluralize, crumb_link
    end

    crumbs.reverse.each do |crumb_obj|
      unless crumb_obj.id.nil?
        crumb_html += ' > ' if crumb_html.length > 0
        crumb_link = url_for :controller => crumb_obj.class.to_s.underscore.pluralize, :action => "show", :id => crumb_obj.id
        crumb_html += link_to crumb_obj.breadcrumb_name, crumb_link
      end
    end

    crumb_html += ' > ' + action + ' ' + obj.class.model_name.human.titleize if !action.nil?
    crumb_html.html_safe
  end
end

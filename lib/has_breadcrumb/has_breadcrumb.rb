module HasBreadcrumb
  module ClassMethods
    def has_breadcrumb options = {}
      define_method :breadcrumb_parent do
        return nil if options[:parent].nil?
        self.send(options[:parent])
      end

      define_method :breadcrumb_name do
        return "" if options[:title].nil?
        case options[:title].class.name
          when "Symbol"
            self.send(options[:title])
          else
            options[:title]
        end
      end
    end
  end

  def self.included(receiver)
    receiver.extend  ClassMethods
  end
end

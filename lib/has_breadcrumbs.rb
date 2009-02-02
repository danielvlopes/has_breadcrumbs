module Breadcrumbs
  module ActionController

    def self.included(base)
      base.send :helper_method, :breadcrumb
    end

    def breadcrumb
      @breadcrumb ||= Breadcrumb.new
    end      

  end
end

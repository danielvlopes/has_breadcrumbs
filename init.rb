require File.dirname(__FILE__) + "/lib/has_breadcrumbs"
require File.dirname(__FILE__) + "/lib/breadcrumb"

ActionController::Base.send :include, SimplesIdeias::Breadcrumbs::ActionController
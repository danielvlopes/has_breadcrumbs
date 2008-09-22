has_breadcrumbs
===============

has_breadcrumbs is a simple plugin that adds a `breadcrumb` object into 
controllers and views.

Instalation
-----------

1) Install the plugin with `script/plugin install git://github.com/fnando/has_breadcrumbs.git`

Usage
-----

On your controller:

	class ApplicationController < ActionController::Base
	  before_filter :add_initial_breadcrumbs
	
	  private
	    def add_initial_breadcrumbs
	      breadcrumb.add 'Home', root_path
	    end
	end

	class ThingsController < ApplicationController
	  def index
	    breadcrumb.add 'Things', things_path
	  end
	end

You don't need to provide an URL; in that case, a span will be generated 
instead of a link:

    breadcrumb.add 'Some page'

You can set additional HTML attributes if you need to:

	breadcrumb.add 'Home', root_path,
		:id => 'home', 
		:title => 'Go to the home page'

On your view (possibly application.html.erb):
  
    <p>
  	  You are here: <%= breadcrumb.display %>
    </p>

You can set your own separator:

  <p>
  	You are here: <%= breadcrumb.display('|') %>
  </p>

Copyright (c) 2008 Nando Vieira, released under the MIT license
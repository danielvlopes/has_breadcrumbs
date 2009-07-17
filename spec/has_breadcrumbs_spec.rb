require File.dirname(__FILE__) + '/spec_helper'

class SampleController < ActionController::Base
end

describe "has_breadcrumbs" do
  before(:each) do
    @app = SampleController.new
    @breadcrumb = Breadcrumb.new
  end
  
  it "controller should respond to breadcrumb method" do
    @app.should respond_to(:breadcrumb)
  end
  
  it "should instantiate breadcrumb" do
    @app.breadcrumb.add 'something'
    @app.instance_variables.should include('@breadcrumb')
  end
  
  it "should instantiate breadcrumb only once" do
    Breadcrumb.should_receive(:new).once.and_return(mock('breadcrumb', :null_object => true))
    @app.breadcrumb.add 'things'
    @app.breadcrumb.add 'something'
  end
  
  # it "should return span when no link is provided" do
  #   @breadcrumb.add 'Things'
  #   @breadcrumb.display.should have_tag('span.breadcrumb.item-0.last', 'Things')
  # end
  # 
  # it "should return A tag when link is provided" do
  #   @breadcrumb.add 'Things', '/things'
  #   @breadcrumb.display.should have_tag('a.breadcrumb.item-0.last[href=/things]', 'Things')
  # end
  # 
  # it "should use default separator" do
  #   @breadcrumb.add 'Things'
  #   @breadcrumb.add 'Something'
  #   @breadcrumb.display.should have_tag('span.separator', '&#187;')
  # end
  # 
  # it "should use custom separator" do
  #   @breadcrumb.add 'Things'
  #   @breadcrumb.add 'Something'
  #   @breadcrumb.display('|').should have_tag('span.separator', '|')
  # end
  # 
  # it "should use options" do
  #   @breadcrumb.add 'Things', '/things', :rel => 'external', :id => 'things', :class => 'link'
  #   @breadcrumb.display.should have_tag('a#things.breadcrumb.item-0.last.link[href=/things][rel=external]')
  # end
  # 
  it "should add new items" do
    @breadcrumb.add 'Things', '/things', :id => 'things'
    @breadcrumb.add 'Something', '/things/something', :id => 'something'
    @breadcrumb.items.last.should == ['Something', '/things/something', {:id => 'something'}]
  end
  
  it "should add helper method" do
    SampleController.should_receive(:helper_method).with(:breadcrumb)
    SampleController.send(:include, SimplesIdeias::Breadcrumbs::ActionController)
  end
end
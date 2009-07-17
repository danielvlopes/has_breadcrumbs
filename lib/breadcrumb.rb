class Breadcrumb
  include ActionView::Helpers::TagHelper
  
  attr_accessor :items
  
  def initialize
    @items = []
  end
  
  def add(name, url=nil, options={})
    @items << [name, url, options]
  end
  
  def display
    size = @items.size
    
    if size > 1    
      crumbs = @items.to_enum(:each_with_index).collect do |item, index|
        name, url, options = item
      
        options[:class] ||= ""
        options[:class] << " item-#{index}"
        options[:class] << " last" if size - 1 == index
        options[:class].squish!

        if url.nil? || (size - 1 == index)
          content_tag(:span, name, options)
        else
          content_tag(:a, name, options.merge(:href => url))
        end
      end.join
      
      content_tag(:ul, crumbs, :id=>"breadcrumbs")
    end
    
  end
  
end

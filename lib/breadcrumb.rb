class Breadcrumb
  include ActionView::Helpers::TagHelper
  
  attr_accessor :items
  
  def initialize
    @items = []
  end
  
  def add(name, url=nil, options={})
    @items << [name, url, options]
  end
  
  def display(separator="&#187;")
    size = @items.size
    @items.to_enum(:each_with_index).collect do |item, index|
      name, url, options = item
      
      options[:class] ||= ""
      options[:class] << " breadcrumb item-#{index}"
      options[:class] << " last" if size - 1 == index
      options[:class].squish!
      
      if size > 1
        if url.nil? || (size - 1 == index)
          content_tag(:span, name, options)
        else
          content_tag(:a, name, options.merge(:href => url))
        end
      end
    end.join(" <span>#{separator}</span> ")
  end
end

module DragOrder::TagExtensions
  def self.included(base)
    unless base.private_method_defined?(:children_find_options_with_drag_order) 
      base.class_eval { alias_method_chain :children_find_options, :drag_order } 
    end
  end
  
  def children_find_options_with_drag_order(tag)
    options = children_find_options_without_drag_order(tag)
    # overriding the default radiant "published_at" sort order
    options[:order].sub!(/published_at/i, 'position') unless tag.attr['by']
    options
  end
end

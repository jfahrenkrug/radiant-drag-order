# Uncomment this if you reference any of your controllers in activate
require_dependency( (Radiant::Version::Major.to_i < 1 and Radiant::Version::Minor.to_i < 8) ? 'application' : 'application_controller' )

class DragOrderExtension < Radiant::Extension
  version "0.3.2"
  description "This extension allows pages to be moved or copied to any arbitrary (valid)
    place in the document tree structure by dragging the page to its new position and
    dropping it there. Created by Bright 4, February 2009. Inspired by and based on Sean
    Cribbs' Reorder extension."
  url "http://www.bright4.nl/"
  
  def activate
    index = (admin.page || admin.pages).index
    index.add :sitemap_head, "admin/pages/drag_order_header", :before=>"title_column_header"
    index.add :node, "admin/pages/drag_order", :before=>"title_column"
    index.add :top, "admin/pages/header"
    Page.send :include, DragOrder::PageExtensions
    (Admin::PageController rescue Admin::PagesController).send :helper, DragOrder::PageHelper
    (Admin::PageController rescue Admin::PagesController).send :include, DragOrder::PageControllerExtensions
    StandardTags.send :include, DragOrder::TagExtensions
  end

  def deactivate
  end
  
end

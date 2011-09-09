ActionController::Routing::Routes.draw do |map|
  begin
    Admin::PageController
    path = "admin/page"
  rescue  
    path = "admin/pages"
  end
  map.with_options :controller => path do |page|
    page.page_move_to "admin/pages/:id/move_to/:rel/:pos/:copy", :action => "move_to"
  end
end
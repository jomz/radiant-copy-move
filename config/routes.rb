ActionController::Routing::Routes.draw do |map|
  map.with_options(:controller => "admin/pages") do |cm|
    cm.copy_page_admin_page     '/admin/pages/:id/copy_page',     :action => 'copy_page'
    cm.copy_children_admin_page '/admin/pages/:id/copy_children', :action => 'copy_children'
    cm.copy_tree_admin_page     '/admin/pages/:id/copy_tree',     :action => 'copy_tree'
    cm.move_admin_page          '/admin/pages/:id/move',          :action => 'move'
  end
end

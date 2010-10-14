require_dependency 'application_controller'

class CopyMoveExtension < Radiant::Extension
  version "2.1.2"
  description "Adds the ability to copy and move a page and all of its children"
  url "http://gravityblast.com/projects/radiant-copymove-extension/"

  def activate
    Admin::PagesController.class_eval do
      include CopyMove::Controller
      helper :copy_move
    end
    Page.class_eval { include CopyMove::Model }
    admin.page.index.add :sitemap_head, 'copy_move_extra_th'
    admin.page.index.add :node, 'copy_move_extra_td', :after => "add_child_column"
    admin.page.index.add :bottom, 'copy_move_popup'
  end
end

module CopyMoveHelper   
  def page_parent_select_tag
    homes = Object.const_defined?(:MultiSiteExtension) ? [ Page.current_site.homepage ] : Page.find_all_by_parent_id(nil)
    list = homes.inject([]) do |l, home|
      l.concat build_tree(home, [])
    end
    options = options_for_select list, (@page.parent ? @page.parent.id : nil)
    select_tag 'parent_id', options
  end
  
  def build_tree(page, list, level = 0)
    label = "#{'-'*level}#{page.title}"
    id = page.id
    list << [label, id]
    
    return list if page.fields.select{|f| f.name == "exclude_children_from_copy_move_target"}.any?
    return list if Radiant::Config["copy_move.exclude_archive_children"] && page.class_name =~ /ArchivePage/
    
    page.children.each do |p|
      build_tree p, list, level + 1
    end
    list
  end
end
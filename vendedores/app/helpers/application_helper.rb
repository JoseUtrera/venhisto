module ApplicationHelper
  def display_tags(book)
    book.tags.sort{ |a, b| a.name <=> b.name }.collect{|tag| link_to tag.name,
      :controller => 'admin/tag', :action => 'show', :id => tag }.join(", ").html_safe if book.tags
  end
end
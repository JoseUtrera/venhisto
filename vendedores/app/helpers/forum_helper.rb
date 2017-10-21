# encoding: utf-8
module ForumHelper
  def display_like_a_tree(posts)
    #Inicializamos la variable content
    content = ''
    for post in posts
      #Mostramos el post root
      url = link_to "#{h post.subject}".html_safe, { :action => 'show', :id => post.id }
      button = button_to 'Borrar', {:action => 'destroy', :method => 'post', :id => post},
                                   :confirm => "Estás seguro que deseas borrar el Post #{post.subject}?"
      # Margin_left es la indentación 
      margin_left = post.depth * 30
      # Mostramos los post child si los hubiera
      content << %(
                   <tr><td><div style="margin-left:#{margin_left}px">
                   #{url} by #{h post.name} &middot; #{post.created_at.strftime "%H:%M:%S %d-%m-%Y"}</div></td>)
      content << %(
                   <td>#{button}</td>) unless post.parent_id != 0
      content << %(</tr>)
    end
    content.html_safe
  end
end

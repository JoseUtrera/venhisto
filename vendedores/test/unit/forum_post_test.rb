require File.dirname(__FILE__) + '/../test_helper'

class ForumPostTest < ActiveSupport::TestCase
  fixtures :forum_posts

  test "create_post_and_reply" do
    ForumPost.destroy_all  # limpia la tabla

    #Creamos un nuevo post, root
    post = ForumPost.new :name => 'George', :subject => 'Subject', :body => 'Body text'
    assert post.save  # Grabamos el post
    assert post.root? # Verificamos que sea un post root
    assert_not_nil ForumPost.find_by_name 'George' #Buscamos el post

    # Creamos una replica al post y asignamos en parent_id el id del post root
    reply = ForumPost.new :name => 'Jill', :subject => 'Reply', :body => 'Reply text', :parent_id => post.id
    assert reply.save   #Grabamos el post
    assert reply.child? #Verificamos que sea un post child

    post.reload
    assert_equal 1, ForumPost.find_all_by_depth(0).size
    assert_equal 1, post.all_children().size
    assert_equal reply, post.all_children()[0]
  end
end

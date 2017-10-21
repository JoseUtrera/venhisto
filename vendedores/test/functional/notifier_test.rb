# encoding: UTF-8
require File.dirname(__FILE__) + '/../test_helper' 

class NotifierTest < ActionMailer::TestCase
  test 'password_reset_instructions' do
    @user = User.create(:name => 'George Jackson', :login => 'George',
                        :email => 'josemanuel.utreralopez@alum.uca.es',
                        :password => 'silver', :password_confirmation => 'silver')
    mail = Notifier.password_reset_instructions(@user)
    assert_equal 'Instrucciones para reinicio de Contraseña.', mail.subject
    assert_equal ['josemanuel.utreralopez@alum.uca.es'], mail.to
    assert_equal 'Vendedores de Historias', mail.from
    assert_match "Estimado #{@user.name}:", mail.body.encoded
    @edit_password_reset_url = "http://localhost:3000/password_reset/edit?id=3D#{@user.perishable_token}"
    # @link = "<a href=\"#{@edit_password_reset_url}\">#{@edit_password_reset_url}"
    assert_match @edit_password_reset_url, mail.body.encoded
  end
end

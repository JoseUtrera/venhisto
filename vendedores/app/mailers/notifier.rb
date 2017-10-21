# encoding: UTF-8

class Notifier < ActionMailer::Base
  default from: 'Vendedores de Historias'

  def password_reset_instructions(user)
    @user       = user
    @subject    = 'Instrucciones para reinicio de Contraseña.'
    @sent_on    = Time.now
    # El host por defecto está definido en el fichero de configuración development.rb
    # A la variable de instancia @edit_password_reset_url se le asigna un enlace a la página
    # web específica que permite al usuario establecer una nueva contraseña.
    # Dicho enlace incluye un token temporal, que pierde su funcionalidad tras unos minutos
    # user.perrishable_token
    @edit_password_reset_url = url_for :controller => 'password_reset', :action => 'edit'
    @edit_password_reset_url += "?id=#{user.perishable_token}"
    mail to: user.email, subject: "Instrucciones para reinicio de Contraseña."
  end
end

class SendEmailsMailer < ApplicationMailer
  def email(subscriber)
    @subscriber = subscriber

    # Initialize a new email
    @email = SibApiV3Sdk::SendSmtpEmail.new
    # Setup email attributes
    @email.sender = {
      "name": 'Info Cocyar',
      "email": 'info@cocyar.com'
    }
    @email.to = [{ "email": @subscriber }]
    @email.html_content = html
    @email.text_content = text
    @email.subject = 'Gracias por completar el formulario'
    @email.reply_to = {
      "email": 'info@cocyar.com',
      "name": 'Info Cocyar'
    }
    # Send your email
    @send_in_blue.send_transac_email(@email)
  end

  private

  def html
    # Create a string with your html email
    '<!DOCTYPE html>
      <html>
        <p>¡Gracias por dejarnos tu contacto!</p>
        <p>Te invitamos a ver el <a href="https://lab9.omatic.com.ar/landing-cocyar/assets/files/brochure_prueba.pdf">brochure</a> de nuestra empresa.</p>
        <p>Área Comercial – COCYAR SA</p>
      </html>'
  end

  def text
    # Create a string with your text email
    '¡Gracias por dejarnos tu contacto!'
    'Te invitamos a ver el brochure de nuestra empresa.'
    'Área Comercial – COCYAR SA'
  end
end

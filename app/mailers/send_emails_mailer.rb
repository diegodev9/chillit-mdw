class SendEmailsMailer < ApplicationMailer
  default from: 'info@cocyar.com'

  def email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber, subject: 'Gracias por completar el formulario')
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

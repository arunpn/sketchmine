class ContactForm < ActionMailer::Base
  default from: "sketchmineco@gmail.com"
  default to: "mailmaximecormier@gmail.com"

  def email_form(message)
  	@message = message
  	mail subject: "Submit #{message.name} left a message"
  end

end

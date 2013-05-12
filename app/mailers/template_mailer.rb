class TemplateMailer < ActionMailer::Base
  default from: 'no-reply@emerald-world.ru'

  def send_template to, message
    @message = message
    mail to: to, subject: message[:subject]
  end
end

class ContactMailer < ActionMailer::Base
  default from: 'do-not-reply@emerald-world.ru'

  def new_message(message)
    @message = message
    mail subject: message.subject, to: User.admin.email
  end
end

class OrderMailer < ApplicationMailer
  default from: 'sandbox1bdc9781f1c140c79a8b2290562f1b13.mailgun.org'
 
  def welcome_email(email)
    @email = email
    @url  = 'http://masterdelov.ru'
    mail(to: 'ss48.a@yandex.ru', subject: "Message from site #{@url}")
  end
end

class ContactMailer < ApplicationMailer
  def notify(contact)
    @contact = contact
    mail(to:ENV["notify_mail_list"].split, subject: "New Lead")
  end
end

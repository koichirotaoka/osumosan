class ContactMailer < ApplicationMailer
  @contact = contact
  
  mail to: @contact.user.email, subject: "お問い合わせの確認メール"
end

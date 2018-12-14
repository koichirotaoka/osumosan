class ContactMailer < ApplicationMailer
    
  ##### 送信元アドレス
  default from: "example@example.com"
  ##### 送信先アドレス
  default to: "********************@gmail.com"

  def received_email(contact)
    ##### メール件名
    mail_subject = "Ruby on Rails 5で作った問い合わせフォームから問い合わせがありました"

    @contact = contact
    mail(:subject => mail_subject)
  end
end

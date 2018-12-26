class ContactMailer < ApplicationMailer
    
  ##### 送信元アドレス
  default from: "example@example.com"
  ##### 送信先アドレス
  default to: "********************@gmail.com"

  def received_email(contact)
    ##### メール件名

    @contact = contact
    mail to: @contact.email, subject: "問い合わせフォームから問い合わせがありました"
  end
end

class ContactMailer < ApplicationMailer
    
  ##### 送信元アドレス
  default from: "osumosan@example.com"
  ##### 送信先アドレス
  default to: "********************@gmail.com"

  def received_email(contact)
    ##### メール件名

    @contact = contact
    mail to: @contact.email, subject: "[お住もうさん]お問い合わせが完了しました"
  end
end

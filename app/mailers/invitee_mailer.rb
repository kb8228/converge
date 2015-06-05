class InviteeMailer < ApplicationMailer
  default from: "kbheadshots@gmail.com"
  def invitation_email(invitee)
    @invitee = invitee
    mail(to: @invitee.email, subject: "You've been invited to hang out!")
  end

  # def password_reset(invitee)
  # end
end

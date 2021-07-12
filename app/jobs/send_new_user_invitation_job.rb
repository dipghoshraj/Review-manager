class SendNewUserInvitationJob < ApplicationJob
  queue_as :default

  def perform(email)
    UserMailer.invite(email).deliver_later(wait: 1.minutes)
  end
end

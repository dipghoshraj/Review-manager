class SendNewUserInvitationJob < ApplicationJob
  queue_as :default

  def perform(email)
    UserMailer.invite(email).deliver_later(wait_until: 1.minutes.from_now)
  end
end

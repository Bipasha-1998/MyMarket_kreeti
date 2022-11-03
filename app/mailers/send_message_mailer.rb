class SendMessageMailer < ApplicationMailer
  def new_message(message)
    @receiver = User.find(message.conversation.receiver_id)
    @sender = User.find(message.conversation.sender_id)
    @curr_user = User.find(message.user_id)
    if @sender == @curr_user
      mail(to: @receiver.email, subject: 'You have a new message')
    else
      mail(to: @sender.email, subject: 'You have a new message')
    end
  end
end

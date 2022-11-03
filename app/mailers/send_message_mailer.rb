class SendMessageMailer < ApplicationMailer
    def new_message(message, sender_id, receiver_id)
        @receiver = User.find(message.conversation.receiver_id)
        @sender = User.find(message.conversation.sender_id)
        mail(to: @receiver.email, subject: "You have a new message" )
    end
end

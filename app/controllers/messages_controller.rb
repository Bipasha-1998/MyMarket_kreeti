class MessagesController < ApplicationController
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end

    def index
        @messages = @conversation.messages
        @message = @conversation.messages.new
    end

    def new
        @message = @conversation.messages.new
    end

    def create
        @message = @conversation.messages.new(message_params)
        @receiver = User.find(@conversation.receiver_id)
        @sender = User.find(@conversation.sender_id)

        if @message.save
            SendMessageMailer.new_message(@message, @sender, @receiver).deliver_now
            redirect_to conversation_messages_path(@conversation)
        end
    end

    private

    def message_params
        params.require(:message).permit(:body, :user_id, :sender_id, :receiver_id)
    end

end
class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = set_new_msg
    @message = set_new_msg.new
  end

  def create
    @message = set_new_msg.new(message_params)
    redirect_to conversation_messages_path(@conversation) if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :sender_id, :receiver_id)
  end

  def set_new_msg
    @conversation.messages
  end
end

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true

  after_create :notify
  
  def message_time
    created_at.strftime('%d/%m/%y at %l:%M %p')
  end

  def notify
    SendMessageMailer.delay.new_message(self)
  end
end

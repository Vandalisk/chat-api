class ChatsController < ApplicationController
  def index
    render json: {
      collection:
        Chat.search_by(params).map do |chat|
          { name: chat.name, messages: chat.messages, participants: chat.participants }
        end
    }
  end
end

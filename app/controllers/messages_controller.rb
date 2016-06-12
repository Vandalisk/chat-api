class MessagesController < ApplicationController
  before_action :replace_params, only: [:create, :get_unreaded]

  def index
    render json: { collection:
      Message.where('receiver_id = ? OR sender_id = ?', params[:user_id], params[:user_id])
    }
  end

  def create
    message = Message.new(permitted_params)
    if message.save
      render json: { message: message }, status: 201
    else
      halt 422, I18n.t('error.validation') do |data|
        data[:errors] = message.errors.full_messages
      end
    end
  end

  def get_unreaded
    messages = Message.where(receiver_id: params[:user_id], state: 'unread')
    render json: { collection: messages, count: messages.count }
  end

  def get_archive
    # render json: { collection: messages, count: messages.count }
  end

  private

  def replace_params
    params[:sender_id] = params[:user_id]
  end

  def permitted_params
    params.permit(Message::PERMITTED)
  end
end

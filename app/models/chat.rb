class Chat < ApplicationRecord
  has_and_belongs_to_many :participants, class_name: 'User'
  has_many :messages

  enum category: [:private_chat, :public_chat, :group_chat]

  scope :search_by, -> (params) do
    result = all
    result = result.by_participants(params[:participants]) if params[:participants]
    result = result.by_name(params[:name]) if params[:name]
    result
  end

  scope :by_participants, -> (participants) {
    joins(:participants).where(users: {id: [participants]}).distinct
  }

  scope :by_name, -> (name) { where(name: name) }

end

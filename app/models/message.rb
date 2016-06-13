class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  belongs_to :chat
  has_many :uploader_files
  accepts_nested_attributes_for :uploader_files

  enum state: [:unread, :read]

  PERMITTED = %i(sender_id receiver_id body)
end

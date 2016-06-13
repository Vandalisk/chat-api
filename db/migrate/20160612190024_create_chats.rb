class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.string :name, null: false
      t.integer :category, default: 0, null: false
      t.timestamps
    end

    create_table :chats_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :chat, index: true
    end

    add_column :messages, :chat_id, :integer
    add_index :messages, :chat_id
    add_index :chats, :category
  end
end

class AddStateToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :state, :integer, default: 0, null: false
    add_index :messages, :state
  end
end

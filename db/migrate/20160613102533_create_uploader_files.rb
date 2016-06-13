class CreateUploaderFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :uploader_files do |t|
      t.string :picture
      t.string :video
      t.string :file
      t.integer :message_id,                      null: false
      t.timestamps
    end

    add_index :uploader_files, :message_id
  end
end

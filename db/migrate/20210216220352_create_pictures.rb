class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :file_name
      t.integer :user_id

      t.timestamps
    end
  end
end

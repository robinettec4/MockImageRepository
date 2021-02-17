class AddIndexToPictures < ActiveRecord::Migration[6.1]
  def change
    add_index :pictures, :user_id
  end
end

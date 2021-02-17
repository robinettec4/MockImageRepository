class AddUserNameToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :user_name, :string
  end
end

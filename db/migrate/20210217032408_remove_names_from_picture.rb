class RemoveNamesFromPicture < ActiveRecord::Migration[6.1]
  def change
    remove_column :pictures, :name, :string
  end
end

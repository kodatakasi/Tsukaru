class RemoveImageFromUser < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :image
  end
  def down
    add_column :users, :image, :string, default: 'blank-profile-picture-973460__480.png'
  end
end

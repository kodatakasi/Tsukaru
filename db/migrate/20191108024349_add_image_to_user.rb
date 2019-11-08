class AddImageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :string, default: 'blank-profile-picture-973460__480.png'
  end
end

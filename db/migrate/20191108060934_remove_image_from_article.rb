class RemoveImageFromArticle < ActiveRecord::Migration[5.2]
  def up
    remove_column :articles, :image
  end

  def down
    add_column :articles, :image, :string
  end
end

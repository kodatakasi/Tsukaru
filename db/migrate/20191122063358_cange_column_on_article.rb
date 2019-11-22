class CangeColumnOnArticle < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :content, false
    change_column_null :comments, :content, false
    change_column_null :onsens, :name, false
    change_column_null :onsens, :prefectures, false
    change_column_null :onsens, :quality, false
    change_column_null :users, :name, false, "匿名さん"
  end
end

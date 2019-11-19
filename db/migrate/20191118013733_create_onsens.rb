class CreateOnsens < ActiveRecord::Migration[5.2]
  def change
    create_table :onsens do |t|
      t.string :name
      t.string :prefectures
      t.string :quality
      t.text :infomation
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end

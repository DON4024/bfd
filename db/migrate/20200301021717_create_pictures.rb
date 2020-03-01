class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :image,       null: false
      t.string :content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

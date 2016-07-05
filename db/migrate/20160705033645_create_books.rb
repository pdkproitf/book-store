class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :category_id
      t.string :title
      t.string :author
      t.Integer :publish_id
      t.string :photo
      t.text :content
      t.float :weight
      t.string :size
      t.Integer :pages
      t.Date :date

      t.timestamps null: false
    end
  end
end

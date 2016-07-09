# comment migrate
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :desc
      t.date :date

      t.timestamps null: false
    end
  end
end

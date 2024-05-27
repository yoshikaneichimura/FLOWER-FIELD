class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :user_id,  null: false
      t.integer :tag_id,   null: false
      t.string  :flower,   null: false
      t.string  :field,    null: false
      t.date    :day,      null: false
      t.integer :star,     null: false
      t.text    :address
      t.text    :detail

      t.timestamps
    end
  end
end

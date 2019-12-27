class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references  :user,          null: false, foreign_key: true
      t.string      :date,          null: false
      t.integer     :prefecture_id, null: false
      t.string      :venue
      t.integer     :count_id
      t.references  :genre,         null: false, foreign_key: true
      t.string      :title,         null: false
      t.text        :comment
      t.integer     :status
      t.timestamps
    end
  end
end

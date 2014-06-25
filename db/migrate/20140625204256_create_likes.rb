class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :image, null: false, index: true

      t.timestamps null: false
    end
    add_index :likes, [:user_id, :image_id], unique: true
  end
end

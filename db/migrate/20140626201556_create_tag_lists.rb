class CreateTagLists < ActiveRecord::Migration
  def change
    create_table :tag_lists do |t|
      t.belongs_to :tag, index: true, null: false
      t.belongs_to :image, index: true, null: false

      t.timestamps null: false
    end
    add_index :tag_lists, [:tag_id, :image_id], unique: true
  end
end

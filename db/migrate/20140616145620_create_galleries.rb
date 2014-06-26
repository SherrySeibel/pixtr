class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end

class AddIndexes < ActiveRecord::Migration
  def change
    # Will disallow duplicate emails. 
    # unique in a migration, uniqueness in a model (in model gives "pretty" errors). 
    add_index :users, :email, unique: true 
    # Table name, column name, index

    # :gallery_id is a foreign key. It gets read a lot and written to very little.
    # Therefore, we add an index.
    add_index :images, :gallery_id
  end
end

class AddUniqueIndexToEmailAndAdmin < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_column :users, :admin, :boolean
  end
end

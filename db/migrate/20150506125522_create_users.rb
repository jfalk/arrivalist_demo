class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :is_admin, null: false, default: false
      t.timestamps null: false
    end
  end
end

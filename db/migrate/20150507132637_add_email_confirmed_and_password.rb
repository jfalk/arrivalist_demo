class AddEmailConfirmedAndPassword < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmed, :boolean, nullable: false, default: false
    add_column :users, :password_digest, :string, nullable: false
  end
end

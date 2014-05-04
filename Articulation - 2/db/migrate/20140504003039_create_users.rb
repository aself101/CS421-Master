class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,             limit: 50, null: false
      t.string :middle_initial,         limit: 1
      t.string :last_name,              limit: 50, null: false
      t.string :email,                  limit: 25, null: false
      t.string :password,               limit: 25, null: false
      t.string :password_confirmation,  limit: 25, null: false

      t.timestamps
    end
  end
end

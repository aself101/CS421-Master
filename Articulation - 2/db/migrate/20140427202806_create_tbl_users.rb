class CreateTblUsers < ActiveRecord::Migration
  def change
    create_table :tbl_users do |t|
      t.string :first_name,     limit: 50, null: false
      t.string :middle_initial, limit: 1
      t.string :last_name,      limit: 50, null: false
      t.string :phone,          limit: 10, null: false
      t.string :email,          limit: 25, null: false

      t.timestamps
    end
  end
end

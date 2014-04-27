class CreateTblStaffs < ActiveRecord::Migration
  def change
    create_table :tbl_staffs do |t|
      t.primary_key :user_id
      t.string :user_id,        limit: 8,  null: false
      t.string :department,     limit: 50, null: false
      t.string :position,       limit: 9,  null: false

      t.timestamps
    end
  end
end

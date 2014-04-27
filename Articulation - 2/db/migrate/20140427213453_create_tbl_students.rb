class CreateTblStudents < ActiveRecord::Migration
  def change
    create_table :tbl_students do |t|
      t.primary_key :user_id
      t.string :user_id,  limit: 8, null: false
      t.string :major,    limit: 100, default: "undeclared", null: false
      t.string :term,     limit: 6, null: false

      t.timestamps
    end
  end
end

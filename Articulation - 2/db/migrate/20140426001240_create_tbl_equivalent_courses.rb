class CreateTblEquivalentCourses < ActiveRecord::Migration
  def change
    create_table :tbl_equivalent_courses do |t|
      t.string :approval_id,     limit: 10, default: "", null: false
      t.string :transfer_id,     limit: 10,              null: false
      t.string :eq_course_alpha, limit: 6,               null: false
      t.string :eq_course_num,   limit: 6,               null: false
      t.string :course_title,    limit: 50,              null: false
      t.string :eq_hours,        limit: 5,               null: false
      t.string :conn,            limit: 3
      t.string :uhh_atr,         limit: 5
      t.string :pr,              limit: 1
      t.index :transfer_id, using: :btree
      t.timestamps
    end
  end
end

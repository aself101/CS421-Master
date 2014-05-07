class CreateTblEquivalentCourses < ActiveRecord::Migration
  def change
    create_table :tbl_equivalent_courses do |t|
      t.primary_key :transferID
      t.string :transferID,      limit: 10, default: "", null: false
      t.string :approvalID,      limit: 10, default: "", null: false
      t.string :eq_course_alpha, limit: 6,               null: false
      t.string :eq_course_num,   limit: 6,               null: false
      t.string :course_title,    limit: 50,              null: false
      t.string :eq_hours,        limit: 5,               null: false
      t.string :conn,            limit: 3
      t.string :uhh_atr,         limit: 5
      t.string :pr,              limit: 1

      t.timestamps
    end
  end
end

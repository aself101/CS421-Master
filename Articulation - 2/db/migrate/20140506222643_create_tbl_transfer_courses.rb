class CreateTblTransferCourses < ActiveRecord::Migration
  def change
    create_table :tbl_transfer_courses do |t|
      t.primary_key :transferID
      t.string :transferID,            limit: 10, null: false
      t.string :transfer_course_alpha, limit: 6,  null: false
      t.string :transfer_course_num,   limit: 6,  null: false
      t.string :course_title,          limit: 50, null: false
      t.string :transfer_inst_name,    limit: 50, null: false
      t.string :transfer_hours,        limit: 8,  null: false
      t.string :effective_term,        limit: 6,  null: false
      t.string :grp,                   limit: 1

      t.timestamps
    end
  end
end

class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.primary_key :student_id_number
      t.string :name,                   limit: 75, null: false
      t.string :student_id_number,      limit: 10, null: false
      t.string :classification,         null: false
      t.string :major,                  limit: 20, default: "Undeclared", null: false
      t.string :address,                limit: 75, null: false
      t.string :email,                  limit: 30, null: false
      t.string :phone,                  limit: 12, null: false
      t.string :transfer_institution,   limit: 50, null: false
      t.string :term,                   null: false
      t.string :course_alpha,           null: false
      t.string :course_number,          limit: 5, null: false
      t.integer :course_hours,          limit: 2, null: false

      t.timestamps
    end
  end
end

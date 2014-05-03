class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.primary_key :student_identification_number
      t.string :name
      t.string :student_identification_number, limit: 10, null: false
      t.string :classification
      t.string :major,          limit: 100, default: "undeclared", null: false
      t.string :address,        limit: 100, null: false
      t.string :email
      t.string :phone
      t.string :transfer_institution, limit: 60,  null: false
      t.string :term,           limit: 6, null: false
      t.string :course_alpha
      t.string :course_number
      t.string :course_hours
      t.string :uh_hilo_equivalent

      t.timestamps
    end
  end
end

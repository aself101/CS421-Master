class CreateTblAndEquivalents < ActiveRecord::Migration
  def change
    create_table :tbl_and_equivalents do |t|
      t.primary_key :articulation_id
      t.string :articulation_id,     limit: 10, null: false
      t.string :eq_course_alpha,     limit: 10, null: false
      t.string :eq_course_num,       limit: 10, null: false
      t.string :course_title,        limit: 50, null: false
      t.integer :eq_hours,           limit: 5, null: false
      t.string :uhh_atr,             limit: 5
      t.timestamps
    end
  end
end

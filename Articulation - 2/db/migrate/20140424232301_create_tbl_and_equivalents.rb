class CreateTblAndEquivalents < ActiveRecord::Migration
  def change
    create_table :tbl_and_equivalents do |t|
      t.string :eq_course_alpha
      t.string :eq_course_num
      t.string :course_title
      t.string :eq_hours
      t.string :uhh_atr

      t.timestamps
    end
  end
end

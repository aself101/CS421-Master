class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :university
      t.text :department
      t.text :course
      t.integer :year
      t.string :semester

      t.timestamps
    end
  end
end

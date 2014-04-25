class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :email
      t.string :major
      t.string :term
      t.integer :year
      t.string :phone

      t.timestamps
    end
  end
end

class CreateTblAdministrators < ActiveRecord::Migration
  def change
    create_table :tbl_administrators do |t|
      t.primary_key :user_id
      t.string :user_id
      t.binary :approval_flag

      t.timestamps
    end
  end
end

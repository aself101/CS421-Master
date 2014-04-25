class CreateTblApproves < ActiveRecord::Migration
  def change
    create_table :tbl_approves do |t|
      t.string   "approval_id",         limit: 10, null: false
      t.string   "user_id",             limit: 8,  null: false
      t.datetime
    end
  end
end

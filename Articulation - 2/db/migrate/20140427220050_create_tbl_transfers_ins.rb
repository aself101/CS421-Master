class CreateTblTransfersIns < ActiveRecord::Migration
  def change
    create_table :tbl_transfers_ins do |t|
      t.primary_key :user_id
      t.string   :user_id,               limit: 8,  null: false
      t.string   :transfer_course_alpha, limit: 6,  null: false
      t.string   :transfer_course_num,   limit: 6,  null: false
      t.string   :transfer_inst_name,    limit: 50, null: false
      t.timestamps
    end
  end
end

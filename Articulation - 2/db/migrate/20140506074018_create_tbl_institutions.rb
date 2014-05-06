class CreateTblInstitutions < ActiveRecord::Migration
  def change
    create_table :tbl_institutions do |t|
      t.primary_key :institution_name
      t.string :institution_name,     limit: 60,  null: false
      t.string   :city,               limit: 60,  null: false
      t.string   :state,              limit: 2,   null: false
      t.string   :zip,                limit: 20,  null: false
      t.string   :website,            limit: 100

      t.timestamps
    end
  end
end

class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :user_id
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end

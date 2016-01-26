class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :name
      t.string :username
      t.string :password
      t.boolean :manager
      t.boolean :admin

      t.timestamps null: false
    end
  end
end

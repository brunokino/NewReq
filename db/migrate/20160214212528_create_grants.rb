class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :username
      t.boolean :manager
      t.boolean :admin

      t.timestamps null: false
    end
  end
end

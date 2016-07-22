class CreatePublicdomains < ActiveRecord::Migration
  def change
    create_table :publicdomains do |t|
      t.string :domain

      t.timestamps null: false
    end
  end
end

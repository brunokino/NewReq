class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :company_id
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :phone

      t.timestamps null: false
    end
  end
end

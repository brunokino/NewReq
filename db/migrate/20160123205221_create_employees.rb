class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :username
      t.string :login_id
      t.string :company_id
      t.string :site_id
      t.string :department
      t.string :phone
      t.string :phoneext
      t.string :mobilephone

      t.timestamps null: false
    end
  end
end

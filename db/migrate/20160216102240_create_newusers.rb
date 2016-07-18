class CreateNewusers < ActiveRecord::Migration
  def change
    create_table :newusers do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :title
      t.string :description
      t.string :company_id
      t.string :site_id
      t.string :department
      t.string :grant_id
      t.string :phone
      t.string :mobile
      t.string :homephone
      t.string :ipphone
      t.string :pager
      t.string :Office
      t.string :City
      t.string :address
      t.string :State
      t.string :Country
      t.string :postalcode
      t.string :pobox
      t.string :website
      t.string :status

      t.timestamps null: false
    end
  end
end

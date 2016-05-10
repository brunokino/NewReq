class CreateLdapservers < ActiveRecord::Migration
  def change
    create_table :ldapservers do |t|
      t.string :domain
      t.string :host
      t.string :port
      t.string :attributename
      t.string :base
      t.string :username
      t.string :password
      t.string :method

      t.timestamps null: false
    end
  end
end

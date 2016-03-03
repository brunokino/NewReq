class CreateNewuserldaps < ActiveRecord::Migration
  def change
    create_table :newuserldaps do |t|
      t.string :dn
      t.string :objectclass
      t.string :givenname
      t.string :sn
      t.string :cn
      t.string :name
      t.string :displayname
      t.string :userPrincipalName
      t.string :sAMAccountName
      t.string :title
      t.string :description
      t.string :company
      t.string :department
      t.string :telephoneNumber
      t.string :facsimileTelephoneNumber
      t.string :homePhone
      t.string :ipPhone
      t.string :mobile
      t.string :physicalDeliveryOfficeName
      t.string :l
      t.string :st
      t.string :streetAddress
      t.string :postalCode
      t.string :postOfficeBox
      t.string :c
      t.string :manager
      t.string :mail
      t.string :proxyAddresses
      t.string :wWWHomePage
      t.string :userPassword
      t.string :newusers_id
      t.timestamps null: false
    end
  end
end

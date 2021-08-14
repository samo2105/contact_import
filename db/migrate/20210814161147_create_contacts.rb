class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :dob
      t.string :phone
      t.string :address
      t.string :credit_card
      t.string :card_franchise
      t.string :email

      t.timestamps
    end
  end
end

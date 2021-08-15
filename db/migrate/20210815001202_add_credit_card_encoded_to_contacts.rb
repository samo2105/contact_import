class AddCreditCardEncodedToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :credit_card_encoded, :string
  end
end

require 'rails_helper'

RSpec.describe Contact, type: :model do

  let(:contact) {build(:contact)}
  let(:user) {create(:user)}
  
  it "is valid with valid attributes" do
    contact.user_id = user.id
    expect(contact.valid?).to eq true
  end

  it "is not valid without a name" do
    contact.name = nil
    expect(contact.valid?).to eq false
  end

  it "is not valid without dob" do
    contact.dob = nil
    expect(contact.valid?).to eq false
  end

  it 'is not valid without dob format' do
    contact.dob = '11-02-2012'
    expect(contact.valid?).to eq false
  end

  it "is not valid without a address" do
    contact.address = nil
    expect(contact.valid?).to eq false
  end

  it "is not valid without a credit_card" do
    contact.credit_card = nil
    expect(contact.valid?).to eq false
  end

  it "is not valid without a card_franchise" do
    contact.card_franchise = nil
    expect(contact.valid?).to eq false
  end
  
  it "is not valid without a credit_card_encoded" do
    contact.credit_card_encoded = nil
    expect(contact.valid?).to eq false
  end
  
  it "is not valid without a email" do
    contact.email = nil
    expect(contact.valid?).to eq false
  end

  it "is not valid without a user" do
    contact.user = nil
    expect(contact.valid?).to eq false
  end

end

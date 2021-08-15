require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}
  
  it "is valid with valid attributes" do
    expect(user.valid?).to eq true
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user.valid?).to eq false
  end

  it "is not valid without password" do
    user.password = nil
    expect(user.valid?).to eq false
  end
end

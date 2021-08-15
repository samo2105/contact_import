require 'rails_helper'

RSpec.describe CsvFile, type: :model do
  let(:csv) {build(:csv_file)}
  let(:user) {create(:user)}
  
  it "is valid with valid attributes" do
    csv.user_id = user.id
    expect(csv.valid?).to eq true
  end

  it "is not valid without an user" do
    csv.user_id = nil
    expect(csv.valid?).to eq false
  end

  it "is not valid without a state" do
    csv.state = nil
    expect(csv.valid?).to eq false
  end

  it "is not valid without a file" do
    csv.file = nil
    expect(csv.valid?).to eq false
  end

  it "is not valid without order" do
    csv.order = nil
    expect(csv.valid?).to eq false
  end
end

require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /index" do

    before(:all) do
      @user = FactoryBot.create(:user)
    end

    it "returns 302 when user not present" do
      get contacts_path
      expect(response.code).to eq("302")
    end
    
    it 'return 200 when user present' do
      sign_in(@user)
      get contacts_path
      expect(response.code).to eq("200")
    end
  end

end

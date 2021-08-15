require 'rails_helper'

FactoryBot.define do
    factory :contact do
        name {'Samuel'}
        dob {'2012-02-11'}
        phone {'(+57) 320-432-05-09'}
        address {'mi casa'}
        credit_card {'XXXXXXXXXXX8431'}
        card_franchise {'American Express'}
        credit_card_encoded {'1234567890'}
        sequence(:email) {|n| "test-#{n.to_s.rjust(3, '0')}@sample.com"}
        association :user
    end
end
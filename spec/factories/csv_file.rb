require 'rails_helper'

FactoryBot.define do
    factory :csv_file do
        association :user
        file {}
        state {0}
        logs {''}
        order {   
            [
                :name,
                :dob,
                :phone,
                :address,
                :credit_card,
                :email
            ]
        }

        after(:build) do |csv_file|
            csv_file.file.attach(
                io: File.open(Rails.root.join('test', 'fixture_files', 'pruebas.csv')),
                filename: 'pruebas.csv',
                content_type: 'text/csv'
            )
        end
    end
end
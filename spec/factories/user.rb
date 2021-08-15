require 'rails_helper'

FactoryBot.define do
    factory :user do
        email {"#{(0...8).map { (65 + rand(26)).chr }.join}@sample.com"}
        password {'123456'}
    end
end
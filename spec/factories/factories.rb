require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence (:email) { |e| "user#{e}@gmail.com" }
    sequence (:username) { |u| "user#{u}" }
    password "password"
  end
end

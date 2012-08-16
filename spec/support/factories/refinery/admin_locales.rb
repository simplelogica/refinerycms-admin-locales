
FactoryGirl.define do
  factory :user_with_locale, :class => Refinery::User do
    sequence(:username) { |n| "refinery#{n}" }
    sequence(:email) { |n| "refinery#{n}@refinerycms.com" }
    password  "refinerycms"
    password_confirmation "refinerycms"
    locale :en
  end
end


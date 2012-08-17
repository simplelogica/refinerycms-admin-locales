FactoryGirl.define do
  factory :user_with_locale, :class => Refinery::User do
    sequence(:username) { |n| "refinery_with_locale#{n}" }
    sequence(:email) { |n| "refinery_with_locale#{n}@refinerycms.com" }
    password  "refinerycms"
    password_confirmation "refinerycms"
    locale :en
  end
end


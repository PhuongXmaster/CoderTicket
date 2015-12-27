FactoryGirl.define do
  factory :ticket do
    user nil
    ticket_type nil
    quantity "MyString"
  end

  factory :user do
    username      "Test User"
    email         "test@example.com"
    password      "password"
    password_confirmation "password"
  end

  factory :region do 
    name          "Ho Chi Minh"
  end

  factory :venue do
    sequence(:name)   { |n| "Test venue #{n}" }
    region            { Region.first || FactoryGirl.create(:region) }
  end

  factory :category do 
    name         'Entertainment'
  end

  factory :event do
    sequence(:name)           { |n| "Test event #{n}" }
    starts_at                 1.day.from_now
    ends_at                   3.days.from_now
    extended_html_description "test description"
    venue                     { Venue.first || FactoryGirl.create(:venue) }
    category                  { Category.first || FactoryGirl.create(:category) }
    has_published             true
    creator                   { User.first || FactoryGirl.create(:user) }
  end
end
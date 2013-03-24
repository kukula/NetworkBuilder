# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    description "MyText"
    icon "MyString"
    lat ""
    lng ""
  end
end

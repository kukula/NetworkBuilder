# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :network do
    name "MyString"
    color "MyString"
    capacity 1
    description "MyText"
  end
end

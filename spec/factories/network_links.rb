# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :network_link do
    start_lat 1.5
    start_lng 1.5
    end_lat 1.5
    end_lng 1.5
    capacity 1
    color "MyString"
    description "MyString"
  end
end

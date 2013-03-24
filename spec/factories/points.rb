# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :point do
    network nil
    lat 1.5
    lng 1.5
  end
end

FactoryGirl.define do

  factory :tweet do
    text              { Faker::Lorem.sentence }
    image              { Faker::Avatar.image }
    user_id             { Faker::Number.between(1,5)}
  end

end
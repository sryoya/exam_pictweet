FactoryGirl.define do

  factory :tweet do
    text              { Faker::Lorem.sentence }
    image              { Faker::Avatar.image }
    user_id             1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
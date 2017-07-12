FactoryGirl.define do
  factory :conference_user do
    rank :regular
    confirmation_token { ('a'..'z').to_a.shuffle[0, 8].join }
    association :conference
    user
  end
end

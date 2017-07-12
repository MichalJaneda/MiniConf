FactoryGirl.define do
  factory :user do
    first_name 'Jan'
    last_name 'Dzban'
    sequence(:email) { |n| "#{first_name}.#{last_name}#{n}@example.com".downcase }

    password { ('a'..'z').to_a.shuffle[0, 8].join }
  end
end

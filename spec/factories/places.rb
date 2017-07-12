FactoryGirl.define do
  factory :place do

    factory :in_poznan do
      association :city, factory: :poznan
      street 'ul. Promienista 45'
    end
  end

  trait :coordinates do
    latitude { rand * 180.00 - 90.00}
    longitude { rand * 360.00 - 180.00}
  end
end

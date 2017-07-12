FactoryGirl.define do
  factory :city do

    factory :szczecin do
      name 'Szczecin'
      association :country, factory: :poland
    end

    factory :poznan do
      name 'Poznań'
      association :country, factory: :poland
    end
  end
end

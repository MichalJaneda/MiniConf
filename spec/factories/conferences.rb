FactoryGirl.define do
  factory :conference do
    name 'Różności'
    starts_at { 2.days.from_now }

    association :host, factory: :user
    association :place, factory: [:in_poznan, :coordinates]
  end
end

require 'rails_helper'

RSpec.describe Country, type: :model do
  subject { FactoryGirl.create(:poland) }

  it 'is valid when params are valid' do
    expect(subject).to be_valid
  end

  context 'name' do

    it 'is invalid when is shorter than 3' do
      subject.name = 'x' * 2
      expect(subject).to_not be_valid
      end

    it 'is invalid when is longer than 40' do
      subject.name = 'x' * 41
      expect(subject).to_not be_valid
    end

    it 'is valid when name is gte 3 or lte 40' do
      subject.name = 'x' * 3
      expect(subject).to be_valid

      subject.name = 'x' * 40
      expect(subject).to be_valid
    end

    it 'is valid when is unique' do
      not_uniq = subject.dup
      expect(not_uniq).to_not be_valid

      expect {not_uniq.save}.to_not change{Country.count}
    end

  end

  it 'has many cities' do
    expect do
      FactoryGirl.create(:szczecin, country: subject)
      FactoryGirl.create(:poznan, country: subject)
    end.to change{subject.cities.count}.from(0).to(2)
  end

end

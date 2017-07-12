require 'rails_helper'

RSpec.describe City, type: :model do
  subject {FactoryGirl.create(:poznan)}

  it 'is valid when params are valid' do
    expect(subject).to be_valid
  end

  context 'name' do

    it 'is invalid when is shorter than 2' do
      subject.name = 'x' * 1
      expect(subject).to_not be_valid
    end

    it 'is invalid when is longer than 85' do
      subject.name = 'x' * 86
      expect(subject).to_not be_valid
    end

    it 'is valid when name is gte 2 or lte 85' do
      subject.name = 'x' * 2
      expect(subject).to be_valid

      subject.name = 'x' * 85
      expect(subject).to be_valid
    end

    context 'in country' do

      it 'is valid when is unique' do
        szczecin = FactoryGirl.build(:szczecin)
        expect {szczecin.save}.to change{City.count}.by(1)
      end

      it 'is not valid when not unique' do
        poznan_dup = subject.dup
        expect {poznan_dup.save}.to_not change{City.count}
      end

    end

  end

end

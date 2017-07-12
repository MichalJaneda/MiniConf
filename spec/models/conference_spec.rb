require 'rails_helper'

RSpec.describe Conference, type: :model do
  subject {FactoryGirl.build(:conference)}

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  context 'host' do

    it 'is invalid when is nil' do
      subject.host = nil
      expect(subject).to_not be_valid
    end

  end

  context 'place' do

    it 'is invalid when is nil' do
      subject.place = nil
      expect(subject).to_not be_valid
    end

  end

  context 'start' do

    it 'is invalid when nil' do
      subject.starts_at = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when before or now' do
      subject.starts_at = Time.now
      expect(subject).to_not be_valid
    end

    it 'is valid when later than now' do
      subject.starts_at = Time.now + 1.hour
      expect(subject).to be_valid
    end

  end

  context 'name' do

    it 'is invalid when nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when longer than 120' do
      subject.name = 'x' * 121
      expect(subject).to_not be_valid
    end

    it 'is valid when longer than 1' do
      subject.name = 'x'
      expect(subject).to be_valid
    end

    it 'is valid when shorter than 121' do
      subject.name = 'x' * 120
      expect(subject).to be_valid
    end

  end

end

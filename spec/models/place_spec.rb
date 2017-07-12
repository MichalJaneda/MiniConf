require 'rails_helper'

RSpec.describe Place, type: :model do
  subject {FactoryGirl.create(:in_poznan, :coordinates)}

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  context 'city' do

    it 'is not valid without city' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

  end

  context 'street' do

    it 'is valid when is nil' do
      subject.street = nil
      expect(subject).to be_valid
    end

    context 'is not nil' do

      it 'is valid when longer than 1' do
        subject.street = 'x'
        expect(subject).to be_valid
      end

      it 'is valid when shorter than 256' do
        subject.street = 'x' * 255
        expect(subject).to be_valid
      end

      it 'is not valid when longer than, equal 256' do
        subject.street = 'x' * 256
        expect(subject).to_not be_valid
      end

    end

  end

  context 'coordinates' do

    context 'are empty,' do

      it 'are valid when both are nil' do
        subject.latitude, subject.longitude = nil, nil
        expect(subject).to be_valid
      end

    end

    context 'are not empty,' do

      it 'are valid when coordinates are in constraints' do
        expect(subject).to be_valid
      end

      it 'are not valid when one and only one is not nil' do
        lat_test = subject.dup
        long_test = subject.dup

        lat_test.latitude = nil
        long_test.longitude = nil

        expect(lat_test).to_not be_valid
        expect(long_test).to_not be_valid
      end

      context 'latitude' do

        it 'is valid when in -90.00 - 90.00' do
          subject.latitude = -90.00
          expect(subject).to be_valid

          subject.latitude = 90.00
          expect(subject).to be_valid
        end

        it 'is not gt than 90.00' do
          subject.latitude = 90.00 + Float::EPSILON
          expect(subject).to be_valid
        end

        it 'is not lt than -90.00' do
          subject.latitude = -90.00 - Float::EPSILON
          expect(subject).to be_valid
        end

      end

      context 'longitude' do

        it 'is valid when in -180 - 180' do
          subject.longitude = -180
          expect(subject).to be_valid

          subject.longitude = 180
          expect(subject).to be_valid
        end

        it 'is not gt than 180' do
          subject.longitude = 180 + Float::EPSILON
          expect(subject).to be_valid
        end

        it 'is not lt than -180' do
          subject.longitude = -180 - Float::EPSILON
          expect(subject).to be_valid
        end

      end

    end

  end
end

require 'rails_helper'

RSpec.describe ConferenceUser, type: :model do
  subject {FactoryGirl.create(:conference_user)}

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  context 'conference' do

    it 'is invalid when is nil' do
      subject.conference = nil
      expect(subject).to_not be_valid
    end

  end

  context 'user' do

    it 'is invalid when is nil' do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when is same as conference host' do
      subject.user = subject.conference.host
      expect(subject).to_not be_valid
    end

  end

  context 'rank' do

    context 'regular' do

      it 'has rank regular' do
        subject.rank = :regular
        expect(subject.rank).to eq 'regular'
      end

    end

  end

  context 'confirmation' do

    context 'is false' do
      let(:not_confirmed) { {confirmed: false, confirmation_date: nil} }

      it 'is not confirmed' do
        subject.attributes = not_confirmed
        expect(subject.is_confirmed?).to eq false
      end

      context 'date is nil' do

        it 'is valid' do
          subject.attributes = not_confirmed
          expect(subject).to be_valid
        end

      end

      context 'date is not nil' do

        it 'is not valid' do
          subject.attributes = not_confirmed
          subject.confirmation_date = 1.day.ago

          expect(subject).to_not be_valid
        end

      end

    end

    context 'is true' do

      context 'date is nil' do
        let(:without_date) { {confirmed: true, confirmation_date: nil} }

        it 'is not valid' do
          subject.attributes = without_date

          expect(subject).to_not be_valid
        end

        it 'is not confirmed' do
          subject.attributes = without_date

          expect(subject.is_confirmed?).to eq false
        end

      end

      context 'date is not nil' do
        let(:confirmed) { {confirmed: true, confirmation_date: 1.day.ago} }

        it 'it is valid when date lt now' do
          subject.attributes = confirmed

          expect(subject).to be_valid
        end

        it 'and is valid and is confirmed' do
          subject.attributes = confirmed

          expect(subject.is_confirmed?).to eq true
        end

        it 'is not valid when date gte now' do
          subject.attributes = confirmed
          subject.confirmation_date = 1.day.from_now

          expect(subject).to_not be_valid
        end

      end

    end

  end

end

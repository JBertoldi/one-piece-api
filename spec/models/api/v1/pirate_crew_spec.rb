require 'rails_helper'

RSpec.describe PirateCrew, type: :model do
  describe 'Model' do
    subject { create(:straw_hats) }

    it 'has a valid factory' do
      expect(build(:straw_hats)).to be_valid
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'duplicate should be invalid' do
      subject
      expect(create(:straw_hats)).to be_invalid
    end

    it { should validate_presence_of(:name) }

    it 'expect name format to be valid' do
      expect(subject.name).to match(/\A([\p{L}.])+(\s[\p{L}.]+)*\Z/)
    end

    it 'expect format to be invalid' do
      invalid_strings = ['Strawhats 0', 'Straw-lala', '  Straw']
      invalid_strings.each do |st|
        expect(st).not_to match(/\A([\p{L}.])+(\s[\p{L}.]+)*\Z/)
      end
    end

    it 'expect name be capitalized' do
      expect(subject.name).to match(subject.name.split.map(&:capitalize).join(' '))
    end

    it 'expect name to not be lowercase' do
      expect(subject.name).not_to match(subject.name.downcase)
    end

    describe 'ActiveModel validations' do
      it { should validate_uniqueness_of(:name) }
    end
  end
end

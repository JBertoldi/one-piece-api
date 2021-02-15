require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'Model' do
    subject { create(:character) }

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'duplicate should be invalid' do
      create(:character)
      expect { create(:character) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without jp_name' do
      subject.jp_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without en_name' do
      subject.en_name = nil
      expect(subject).to_not be_valid
    end

    it 'expect english_name format to be valid' do
      expect(subject.en_name).to match(/\A([\p{L}.])+(\s[\p{L}.]+)*\Z/)
    end

    it 'expect format to be invalid' do
      invalid_strings = ['Luffy0', 'Luffy-dono', '  Lala']
      invalid_strings.each do |st|
        expect(st).not_to match(/\A([\p{L}.])+(\s[\p{L}.]+)*\Z/)
      end
    end

    it 'expect english_name be capitalized' do
      expect(subject.en_name).to match(subject.en_name.split.map(&:capitalize).join(' '))
    end

    it 'expect english_name to not be lowercase' do
      expect(subject.en_name).not_to match(subject.en_name.downcase)
    end

    describe 'ActiveModel validations' do
      unique_attrs = %i[en_name jp_name epithet]
      unique_attrs.each do |attr|
        it { should validate_uniqueness_of(attr) }
      end
    end
  end
end

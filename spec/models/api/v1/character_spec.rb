require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'Model' do
    subject { create(:luffy) }

    it 'has a valid factory' do
      expect(build(:luffy)).to be_valid
      expect(build(:zoro)).to be_valid
      expect(build(:luffy2)).to be_valid
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'duplicate should be invalid' do
      subject
      expect { create(:luffy) }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it { should validate_presence_of(:jp_name) }
    it { should validate_presence_of(:en_name) }

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

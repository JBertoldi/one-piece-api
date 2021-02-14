require 'rails_helper'

RSpec.describe DevilFruit, type: :model do
  describe 'Model' do
    subject { create(:devil_fruit) }

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'duplicate should be invalid' do
      create(:devil_fruit)
      expect { create(:devil_fruit) }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'expect name format to be valid' do
      expect(subject.name).to match(/\A([\p{L}.])+(\s[\p{L}.]+)*\Z/)
    end

    it 'expect format to be invalid' do
      invalid_strings = ['Gomu 0', 'Gomu-dono', '  Gomu']
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

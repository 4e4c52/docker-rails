require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires first_name to be set' do
      expect(subject.valid?).not_to be
      expect(subject.errors[:first_name].size).to eq(1)
    end

    it 'requires last_name to be set' do
      expect(subject.valid?).not_to be
      expect(subject.errors[:last_name].size).to eq(1)
    end
  end
end

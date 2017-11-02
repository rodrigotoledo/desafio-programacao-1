require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'CRUD for User' do
    it 'fail on create User without attributes' do
      user = User.new
      expect(user.save).to eq(false)
    end

    it 'create User with success' do
      user = build(:user)
      expect(user.save).to eq(true)
    end
  end
end

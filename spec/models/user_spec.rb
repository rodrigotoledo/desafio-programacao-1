require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'CRUD for users' do
    it 'create user with success' do
      user = build(:user)
      expect(user.save).to eq(true)
    end

    it 'fail on create user without params' do
      user = User.new
      expect(user.save).to eq(false)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'correct email' do
    it 'is database authenticable' do
      user = User.create(
        email: 'test@example.com', 
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user.valid_password?('password123')).to be_truthy
    end
  end
  context 'invalid email' do
    it 'is database authenticable' do
      user = User.create(
        email: 'test', 
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user.errors.messages[:email][0]).to eq('is invalid')
    end
  end
  context 'email should be unique' do
    it 'is database authenticable' do
      user1 = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      user2 = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user2.errors.messages[:email][0]).to eq('has already been taken')
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create a new user with valid credentials' do
      user = User.new(
        name: 'username',
        email: 'test@test.com',
        password: 'testing'
      )

      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(
        name: nil,
        email: 'test@test.com',
        password: 'testing'
      )

      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(
        name: 'username',
        email: 'test@test.com',
        password: nil
      )

      expect(user).to_not be_valid
    end

    it 'must have a password of at least 6 characters' do
      user = User.new(
        name: 'username',
        email: 'test@test.com',
        password: 'six'
      )

      expect(user).to_not be_valid
    end
    
    it 'must have a password that matches password confirmation' do
      user = User.new(
        name: nil,
        email: 'test@test.com',
        password: 'testing',
        password_confirmation: 'anotherTest'
      )

      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(
        name: 'username',
        email: nil,
        password: 'testing'
      )

      expect(user).to_not be_valid
    end

    it 'must have a unique email' do
     user = User.new(name: 'username', email: 'test@test.com', password: 'testing')
     user.save

     u = User.new(name: 'username', email: 'TEST@TEST.COM', password: 'testing')
     u.save

     expect(u.errors.get(:email)).to eq(["has already been taken"])
    end
  end
end

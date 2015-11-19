require 'rails_helper'
describe User  do
  describe '#create' do
    it 'is invalid if nickname is over 6 characters' do
      user = User.new(nickname: "aaaaaaa", password: "11111111", password_confirmation: "11111111", email: "a@gmail.com" )
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    it 'is invalid without a nickname' do
      user = User.new(nickname: "", password: "11111111", password_confirmation: "11111111", email: "a@gmail.com" )
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = User.new(nickname: "aaaaaa", password: "11111111", password_confirmation: "11111111", email: "" )
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a nickname and an email' do
      user = User.new(nickname: "", password: "11111111", password_confirmation: "11111111", email: "" )
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid if an email already exists' do
    user1 = User.new(nickname: "aaaaaa", password: "11111111", password_confirmation: "11111111", email: "a@gmail.com" )
    user1.save
    user2 = User.new(nickname: "bbbbbb", password: "11111111", password_confirmation: "11111111", email: "a@gmail.com" )
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
    end

  end
end
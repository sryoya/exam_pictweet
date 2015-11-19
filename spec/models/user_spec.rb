require 'rails_helper'
describe User  do
  describe '#create' do
    it 'is invalid if nickname is over 6 characters' do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    it 'is invalid without a nickname' do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a nickname and an email' do
      user = build(:user, nickname: "", email: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid if an email already exists' do
    user1 = create(:user)
    user2 = build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
    end

  end
end
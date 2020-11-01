require 'rails_helper'

RSpec.describe User do
  describe '#create' do
    it "名前、メール、パスワードがある場合、有効である" do
      user = User.new(
        name: "testman",
        email: "testman@example.com",
        password: "password"
      )
      expect(user).to be_valid
    end
    it "名前がない場合、無効である" do
      user = User.new(
        name: nil,
        email: "testman@example.com",
        password: "password"
      )
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "メールアドレスがない場合、無効である" do
      user = User.new(
        name: "testman",
        email: nil,
        password: "password"
      )
      expect(user.valid?).to eq(false)
    end
    it "重複したメールアドレスの場合、無効である" do
      FactoryBot.create(:user, email: "test@mail.com")
      user = FactoryBot.build(:user, email: "test@mail.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
    it "パスワードがない場合、無効である" do
      user = User.new(
        name: "testman",
        email: "testman@example.com",
        password: nil
      )
      expect(user.valid?).to eq(false)
    end
  end
end

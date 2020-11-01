require 'rails_helper'

RSpec.describe User do
  describe '#create' do
    it "名前、メール、パスワードがある場合、有効である" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    it "名前がない場合、無効である" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "メールアドレスがない場合、無効である" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "重複したメールアドレスの場合、無効である" do
      FactoryBot.create(:user, email: "test@mail.com")
      user = FactoryBot.build(:user, email: "test@mail.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
    it "パスワードがない場合、無効である" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end

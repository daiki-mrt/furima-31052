require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    it "すべての値が正しく入力されていれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "すでに登録されたemailだと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@がないと登録できない" do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上でないと登録できない" do
      @user.password = "a2a2"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは英数混合でないと登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must include be alphanumeric character")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password_confirmationはpasswordと同じでないと登録できない" do
      @user.password_confirmation = "1a1a1a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_name_kanjiが空だと登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it "first_name_kanjiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.first_name_kanji = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji must be full character")
    end
    it "family_name_kanjiが空だと登録できない" do
      @user.family_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end
    it "family_name_kanjiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.family_name_kanji = "ｼﾞﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji must be full character")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが全角（カタカナ）でないと登録できない" do
      @user.first_name_kana = "次郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana must be kana character")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "family_name_kanaが全角（カタカナ）でないと登録できない" do
      @user.family_name_kana = "田中"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana must be kana character")
    end
    it "birthが空だと登録できない" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end

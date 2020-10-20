require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入機能" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it "すべての値が正しく入力できていれば登録できる" do
      expect(@order_address).to be_valid
    end

    it "user_idが空だと登録できない" do
      @order_address.user_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空だと登録できない" do
      @order_address.item_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it "postal_codeが空だと登録できない" do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeにハイフンが含まれていないと登録できない" do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code must be input correctly")
    end

    it "postal_codeの桁数が足りないと登録できない" do
      @order_address.postal_code = "123-456"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code must be input correctly")
    end

    it "postal_codeに数字以外が含まれると登録できない" do
      @order_address.postal_code = "123-456a"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code must be input correctly")
    end

    it "prefecture_idが空だと登録できない" do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "prefecture_idが0だと登録できない" do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be selected")
    end

    it "cityが空だと登録できない" do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")

    end
    it "street_numが空だと登録できない" do
      @order_address.street_num = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street num can't be blank")
    end

    it "phone_numが空だと登録できない" do
      @order_address.phone_num = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
    end

    it "phone_numにハイフンが含まれていると登録できない" do
      @order_address.phone_num = "090-123-456"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is invalid")
    end

    it "phone_numが9桁以下だと登録できない" do
      @order_address.phone_num = "090123456"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is invalid")
    end

    it "phone_numが12桁以上だと登録できない" do
      @order_address.phone_num = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is invalid")
    end

  end
end

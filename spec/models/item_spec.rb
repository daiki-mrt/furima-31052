require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end

    it "すべての値が正しく入力できていれば登録できる" do
      expect(@item).to be_valid
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "contentが空だと登録できない" do
      @item.content = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it "category_idが0だと登録できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "status_idが0だと登録できない" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it "charge_type_idが0だと登録できない" do
      @item.charge_type_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge type must be other than 0")
    end
    it "prefecture_idが0だと登録できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it "ship_durationが0だと登録できない" do
      @item.ship_duration_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship duration must be other than 0")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが全角数字だと登録できない" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが300未満だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000以上だと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "userが空だと登録できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end    
  end
end
FactoryBot.define do
  factory :item do
    name             {"テスト品"}
    content          {"テストテストテスト"}
    category_id      {1}
    status_id        {1}
    charge_type_id   {1}
    prefecture_id    {1}
    ship_duration_id {1}
    price            {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/test_image.jpg"), filename: "test_image.jpg")
    end
  end
end

FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}    
    postal_code {"123-4567"}
    prefecture_id {1}
    city {"名古屋市"}
    street_num {"1-1"}
    phone_num {"09012345678"}
  end
end

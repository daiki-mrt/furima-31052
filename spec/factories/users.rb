FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password                {"a2a2a2"}
    password_confirmation   {password}
    first_name_kanji        {"次郎"}
    family_name_kanji       {"田中"}
    first_name_kana         {"ジロウ"}
    family_name_kana        {"タナカ"}
    birth                   {Date.yesterday}
  end
end
FactoryBot.define do
  factory :user do
    nickname              { 'なみき' }
    email                 { 'test@test' }
    password              { 'abc123' }
    password_confirmation { password }
    lastname_kanji        { '藤井' }
    firstname_kanji       { '波輝' }
    lastname_kana         { 'フジイ' }
    firstname_kana        { 'ナミキ' }
    birthday              { '1991/12/02' }
  end
end

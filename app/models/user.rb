class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname           
    validates :family_name_kanji  ,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "must be full character"}
    validates :first_name_kanji   ,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "must be full character"}
    validates :family_name_kana   ,format: { with: /\A[ァ-ン]+\z/, message: "must be kana character"}
    validates :first_name_kana    ,format: { with: /\A[ァ-ン]+\z/, message: "must be kana character"}
    validates :birth
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "must include be alphanumeric character" 
end
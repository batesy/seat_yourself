class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reservations
  has_many :restaurants, through: :reservations
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end

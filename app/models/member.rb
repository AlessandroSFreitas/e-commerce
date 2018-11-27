class Member < ApplicationRecord
  ratyrate_rater

  has_many :ads

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes, dependent: :destroy
  has_one_attached :my_image
  has_many :bikes , dependent: :destroy

  validates :username, presence: true
end

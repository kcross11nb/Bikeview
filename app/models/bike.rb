class Bike < ApplicationRecord
    belongs_to :user
    has_one_attached :top_photo
    has_many_attached :photos

    with_options presence: true do
      validates :name
      validates :description
    end
end

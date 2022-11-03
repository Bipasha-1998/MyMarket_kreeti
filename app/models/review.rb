class Review < ApplicationRecord
    belongs_to :product

    validates :reviewer, presence: true, length: { minimum: 4, maximum: 50 }
    validates :review_body, presence: true, length: { minimum: 6, maximum: 100 }
end
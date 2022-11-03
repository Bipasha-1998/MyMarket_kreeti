class Product < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :reviews

    has_many_attached :pictures

    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 500}
    validates :price, presence: true, numericality: true
    validates :category_id, presence: true
    validates :city, presence: true
    validates :phone_number, presence: true, uniqueness: true, numericality: true


    scope :filter_by_title, -> (title) { where("lower(title) LIKE ?", "%#{title}%")}
    scope :filter_by_category, -> (category_id) { where category_id: category_id }
    scope :filter_by_city, -> (city) { where("lower(city) LIKE ?", "%#{city}%")}
end
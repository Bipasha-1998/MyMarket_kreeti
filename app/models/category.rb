class Category < ApplicationRecord
  has_many :products

  paginates_per 5
end

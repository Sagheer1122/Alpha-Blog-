class Artical < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :category, presence: true
  belongs_to :user, optional: true
  CATEGORIES = [ "Food", "Travel", "Technology", "Lifestyle", "News" ]
end

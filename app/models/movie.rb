class Movie < ApplicationRecord
  has_many :bookmarks
  has_one_attached :photo
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end

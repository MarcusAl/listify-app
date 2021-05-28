class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  has_many :bookmarks
  validates :overview, presence: true
end

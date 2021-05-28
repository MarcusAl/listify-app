class List < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
end

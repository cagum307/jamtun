class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :text, presence: true
end

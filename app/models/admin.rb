class Admin < ApplicationRecord
  validates :adminid, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  has_secure_password
end

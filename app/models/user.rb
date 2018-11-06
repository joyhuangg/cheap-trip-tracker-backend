class User < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive:false}
end

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :tasks, dependent: :destroy
end

class User < ActiveRecord::Base
  has_secure_password

  validates :email, :firstname, :lastname, presence: true
  validates :password, length: {in: 6..20}, on: :create
  has_many :reviews

  def full_name
    "#{firstname} #{lastname}"
end

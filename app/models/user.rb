class User < ActiveRecord::Base
  has_secure_password

  validates :email, :firstname, :lastname, presence: true
  validates :password, length: {in: 6..20}, on: :create
  has_many :reviews, dependent: :destroy

  # before_destroy :email_send


  def full_name
    "#{firstname} #{lastname}"
  end

  # def email_send
  #   binding.pry
  #   UserMailer.delete_email(self).deliver_now 
  # end

end

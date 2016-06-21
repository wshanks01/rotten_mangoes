class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movies

  validates :user, :movie, :text, presence: true
  validates :rating_out_of_ten, numericality: {only_integer: true}
  validates :rating_out_of_ten, numericality: {greater_than_or_equal_to: 1}
  validates :rating_out_of_ten, numericality: {less_than_or_equal_to_: 10}


end

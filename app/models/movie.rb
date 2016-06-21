class Movie < ActiveRecord::Base
  validates :title, :director, :description, :poster_image_url, :release_date, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validate :release_date_is_in_the_past
  has_many :reviews
  mount_uploader :image, PosterImageUploader

  def review_average
    return 0 if reviews.size == 0
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected
  
  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end 
  end
end

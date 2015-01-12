class Ride < ActiveRecord::Base
  belongs_to :user
  has_many :intervals, as: :intervaled
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, :make, :model, :category, :unit_of_measurement, presence: true
  validates :year, presence: true, numericality: true, :inclusion => { in: 1900..Date.today.year+1, message: "needs to be between 1900-#{Date.today.year+1}"}
  validate :picture_size
  


  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
end

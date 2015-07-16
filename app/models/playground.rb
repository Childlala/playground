class Playground < ActiveRecord::Base
  
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :title, presence: true,
                    length: { minimum: 5 }
                    
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end                  
end

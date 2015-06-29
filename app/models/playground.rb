class Playground < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :title, presence: true,
                    length: { minimum: 5 }
end

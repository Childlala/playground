class Kit < ActiveRecord::Base

  has_many :playgrounds
  mount_uploader :kitpic, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true

end

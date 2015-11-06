class Photo < ActiveRecord::Base
  belongs_to :blog, counter_cache: true
  mount_uploader :photo_file, PhotoUploader
  #validates :name, presence: true
end

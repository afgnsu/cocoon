class Blog < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  validates :title, :content, presence: true
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :photos, \
  #  reject_if: proc{ |param| param[:photo_name].blank? && param[:photo_file].blank? && param[:photo_file_cache].blank? && param[:id].blank? }, \
  #  allow_destroy: true
end

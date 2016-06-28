class Apartment < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_attached_file :image, styles: { medium: "300x300>", large: "600x600>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

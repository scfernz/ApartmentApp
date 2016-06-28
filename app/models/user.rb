class User < ActiveRecord::Base
  has_many :apartments
  has_attached_file :avatar,
    styles: {
      medium: "300x300>",
      large: "600x600>",
      thumb: "100x100>" },
    :default_url => "/assets/missing_avatar_:style.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

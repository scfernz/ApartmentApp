class User < ActiveRecord::Base
  rolify
  after_create :assign_role

  def assign_role
    add_role(:user)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:twitter]
  has_many :apartments
  has_attached_file :avatar,
    styles: {
      medium: "300x300>",
      large: "600x600>",
      thumb: "100x100>" },
    :default_url => "/assets/missing_avatar_:style.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.uid + "@twitter.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

end

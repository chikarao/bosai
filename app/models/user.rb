class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :twitter]
  belongs_to :organization, optional: true ###################
  has_many :requests
  has_many :messages
  belongs_to :evacuation_point, optional: true ##############

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :reverse_geocode
  after_validation :geocode, if: :address_changed?

  ##########Fix For Japanese Lacation Name######################
  before_save :drop_japanease
  ##############################################################

  ##########################################################################################
  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
####################################################################################
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(first_name: auth.info.nickname,
                         last_name: "@twitter",
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    "#{auth.info.urls[:Twitter]}@Twitter",
                         password: Devise.friendly_token[0,20],
                         facebook_picture_url: auth.info.image
                        )
    end
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end
####################################################################################
   def update_without_current_password(params, *options)
     params.delete(:current_password)

     if params[:password].blank? && params[:password_confirmation].blank?
       params.delete(:password)
       params.delete(:password_confirmation)
     end

     result = update_attributes(params, *options)
     clean_up_passwords
     result
   end
###############################################
  def drop_japanease
    #byebug
    unless self[:address].nil?
      location_arr = self[:address].split(",")
      location_arr.pop
      self[:address] = location_arr.join(",")
    end
  end
################################################
end

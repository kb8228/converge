class User < ActiveRecord::Base

  has_secure_password # (validations: false) - this allowed user creation but pw digest is nil
  has_secure_token

  has_many :meetups, dependent: :destroy
  belongs_to :location

end

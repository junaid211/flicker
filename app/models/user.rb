require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :email, :hobbies, :name, :password
  before_save { |user| user.email = email.downcase }
  before_save :transform_password
  #validates :password, length:{ minimum:6 }, :presence => true
  validates :name,  :presence => true, :length => { :maximum => 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX } ,
  :uniqueness => { :case_sensitive => false }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create


  #has_secure_password
  def transform_password
    self.password = Digest::SHA1.hexdigest self.password
  end
  def self.authenticate(email="", password="")
    if VALID_EMAIL_REGEX.match(email)
      user = User.find_by_email(email)
    end

    if user && user.match_password(password)
      return user
    else
      return false
    end
  end

  def match_password(password="")
    encrypted_password == Digest::SHA1.hexdigest(password)
  end


end

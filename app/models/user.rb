class User < ApplicationRecord
  has_one :profile, :dependent => :destroy
  has_many :cars
  has_many :enquiries

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :first_name
  validates_uniqueness_of :email

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:lockable,
         :recoverable, :rememberable, :validatable,:confirmable, authentication_keys: [:login]

 
  def login
    @login || self.phone || self.username || self.email
  end
  
  def email_required?
    false
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email)= :value OR lower(phone)= :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:phone) || conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
end
 
end
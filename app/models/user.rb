class User < ActiveRecord::Base
  after_create :assign_default_role
  
  has_many :subscribers
  has_many :notifications
  has_many :comments
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rater
  
  validates :email, presence: true, uniqueness: true
  
  def method_missing(name, *args, &block)
    self
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end

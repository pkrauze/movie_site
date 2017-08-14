class User < ActiveRecord::Base
  
  has_many :subscribers
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rater
  
  def method_missing(name, *args, &block)
    self
  end

end

class Guest < ActiveRecord::Base
  def email
      "Guest"
  end
  
  def method_missing(name, *args, &block)
    self
  end
  
  def has_role?(role)
    false
  end
end

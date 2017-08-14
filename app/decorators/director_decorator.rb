class DirectorDecorator < Draper::Decorator
  delegate_all

  def fullname
    self.firstname + " " + self.lastname
  end

end

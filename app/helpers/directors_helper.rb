module DirectorsHelper
  def sub_exist(user_id, director_id)
    relationship = Subscriber.find_by(user_id: user_id, director_id: director_id)
    return true if relationship
  end
end

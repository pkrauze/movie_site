module GenresHelper
  def sub_genre_exist(user_id, genre_id)
    relationship = Subscriber.find_by(user_id: user_id, genre_id: genre_id)
    return true if relationship
  end
end

module ApplicationHelper
  def search_id(value)
    picture = @pictures.find_by(user_id: value.follow_id)
    return picture.user_id
    
  end
end

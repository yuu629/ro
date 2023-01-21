module ApplicationHelper

  def avatar_url(user)
    if user.avatar.attached?
        url_for(user.avatar)
    elsif user.image?
        user.image
    else
        ActionController::Base.helpers.asset_path('icon_default_avatar.jpg')
    end
  end

  def room_cover(room)
    if room.photos.attached?
        url_for(room.photos[0])
    else
        ActionController::Base.helpers.asset_path('blank.jpg')
    end
  end
end

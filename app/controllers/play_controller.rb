class PlayController < ApplicationController
  def index
  end
  def info
  	map  = Map.where(["regist_user = ?", session[:id]])
  	if map.blank?
  		map = '{}'
  	end

  	clip = Clip.joins("LEFT JOIN maps ON clips.mapid = maps.id").select("clips.created_at, maps.mapname").where("clips.regist_user = ? ", session[:id])
  	if clip.blank?
  		clip = '{}'
  	end

  	user = User.where(["id = ?", session[:id]]).pluck(:email, :pref, :mm)
  	render json: '{"map":[' + map.to_json + '],"clip":[' + clip.to_json + '],"user":' + user.to_json + '}'
  end
  def allinfo
    map  = Map.order("created_at DESC").limit(10)
    if map.blank?
      map = '{}'
    end

    clip = Clip.joins("LEFT JOIN maps ON clips.mapid = maps.id").select("clips.created_at, maps.mapname").order("created_at DESC").limit(10)
    if clip.blank?
      clip = '{}'
    end

    comment  = Comment.order("created_at DESC").limit(10)
    if comment.blank?
      comment = '{}'
    end
    render json: '{"map":' + map.to_json + ',"clip":' + clip.to_json + ',"comment":' + comment.to_json + '}'
  end
end

class PlayController < ApplicationController
  def index
  end
  def info
  	map  = Map.where("regist_user = ? ", session[:id])
  	if map.blank?
  		map = '{}'
  	end

  	clip = Clip.where("regist_user = ? ", session[:id])
  	if clip.blank?
  		clip = '{}'
  	end
  	user = User.where(["id = ?", session[:id]]).pluck(:email, :pref, :mm)
  	render json: '{"map":[' + map.to_json + '],"clip":[' + clip.to_json + '],"user":' + user.to_json + '}'
  end
end

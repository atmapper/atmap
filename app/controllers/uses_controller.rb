class UseController < ApplicationController
  skip_before_filter :authorize

  def index
  end
  def one
    if Map.find_by_id(params[:id]).blank?
      render json: '{}', status: 404 and return
    end
    use = Use.where(["mapid = ?", params[:id]]).count
    if !use.blank?
      render json: t, status: :ok
    else
      render json: '{}', status: :ok
    end
  end

  def create
      if Map.find_by_id(params[:id]).blank?
        render json: '{}', status: 404 and return
      end

      t = Use.new();
      t.mapid = params[:id];
      if !session[:id].blank?
        t.regist_user = session[:id]
      end
      if t.save
        render json: t,status: :ok
      else
        render json: '{}',status: 400
      end
  end
end

class SearchController < ApplicationController
  skip_before_filter :authorize

  def index
  end
  def one
    if Map.find_by_id(params[:id]).blank?
      render json: '{}', status: 404 and return
    end
    sea = Search.where(["mapid = ?", params[:id]]).count

    if sea != 0 then
      render text: sea, status: :ok
    else
      render text: '0', status: :ok
    end
  end
end

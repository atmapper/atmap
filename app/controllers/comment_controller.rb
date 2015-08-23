class CommentController < ApplicationController
  skip_before_filter :authorize
  def index
  end
  def comlist
    com = Comment.joins("LEFT JOIN users ON comments.regist_user = users.id").select("comments.id, comments.value, comments.created_at, users.name").where(["mapid = ?",params[:id]])
    render json: com,status: :ok
  end

  def create
    t = Comment.new();
      t.mapid = params[:mapid];
      t.value = params[:value];

      if !session[:id].blank?
        t.regist_user = session[:id]
      end

      if t.save
        com = Comment.joins("LEFT JOIN users ON comments.regist_user = users.id").select("comments.id, comments.value, comments.created_at, users.name").where(["mapid = ?",params[:mapid]])
        render json: com,status: :ok
      else
        render json: '{}',status: 400
      end
  end
end

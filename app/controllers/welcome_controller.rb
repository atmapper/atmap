class WelcomeController < ApplicationController
  skip_before_filter :authorize
  def index
  end
  def data
    t = Map.order("created_at DESC").limit(10)
    render json: t,status: :ok
  end
end

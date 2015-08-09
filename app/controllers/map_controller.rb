class MapController < ApplicationController
	def index
	end
	def create
		t = Map.new();
  		t.mapname = params[:mapname];

  		t.lat = params[:lat];
  		t.lgn = params[:lgn];
  		t.body = '';
  		t.clean = 1;
  		t.famous = 1;
  		t.infoseek = 1;
    	if t.save
    	  render :action => 'index'  , :status => 200
    	else
    	  render :action => 'index'  , :status => 500
    	end
	end
	def list
    t = Map.where(["
      lat > ?
      and lgn > ? 
      and lat < ?
      and lgn < ?",
       params[:swlat], params[:swlng], params[:nelat], params[:nelng]]
      )
    logger.debug(t);
    render json: t,status: :ok
	end
  def show
  end
end

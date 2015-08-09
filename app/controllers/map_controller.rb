class MapController < ApplicationController
	def index
	end
	def create
		idstr = Time.now.strftime("%Y%m%d%H%M%S") + (0..9).to_a.sample(5).join
		t = Map.new(id: idstr);
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
	def show
	end
	def list
	end
end

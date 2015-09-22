class MapController < ApplicationController
  skip_before_filter :authorize
	def keysearch
    @keyword = params[:keyword];
    render :action => 'index'
	end
  def locsearch
    @input_lat = params[:lat];
    @input_lgn = params[:lgn];
    render :action => 'index'
  end
  def view
    map = Map.find_by_id(params[:id])
    @mapname = map.mapname
    @lat = map.lat
    @lgn = map.lgn
    @kind = map.kind
    @id = params[:id]
    @create = map.created_at
  end
	def create
		t = Map.new();
  		t.mapname = params[:mapname];
  		t.lat = params[:lat];
      t.lgn = params[:lgn];
      t.kind = params[:kind];
      t.memo = params[:memo];
  		t.body = '';
  		t.clean = 1;
  		t.famous = 1;
  		t.infoseek = 1;

      logger.debug session[:id]
      if !session[:id].blank?
        t.regist_user = session[:id]
      end

    	if t.save
    	  render json: t,status: :ok
    	else
    	  render json: '{}',status: 400
    	end
	end
	def list
    select_column = 'id,mapname,body,lat,lgn,kind,created_at,updated_at,regist_user,memo, abs (' + params[:cenlat] + '- lat) + abs ('+ params[:cenlgn] +' - lgn) as dist'
    t = Map.select(select_column).where(["lat > ? and lgn > ? and lat < ? and lgn < ?",
       params[:swlat], params[:swlng], params[:nelat], params[:nelng]]
      ).limit(10).order('dist')
    render json: t,status: :ok
	end
  def one
      if Map.find_by_id(params[:id]).blank?
        render text: '0', status: 404 and return
      end
      clip = Clip.where(["mapid = ?", params[:id]]).count
      if clip != 0 then
        render text: clip, status: :ok
      else
        render text: '0', status: :ok
      end
  end

  def clip
      if Map.find_by_id(params[:id]).blank?
        render json: '{}', status: 404 and return
      end

      if session[:id].blank?
        render json: '{}', status: 401 and return
      end

      t = Clip.new();
      t.mapid = params[:id];
      t.regist_user = session[:id]

      if t.save
        render json: t,status: :ok
      else
        render json: '{}',status: 400
      end
  end
  def show
  end
end

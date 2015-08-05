class WelcomeController < ApplicationController
  def index
  	logger.debug("index");
  end
  def start
  	logger.debug("start");
  end
  def add
  	t = Tweet.new(id: '4567');
  	t.username = '草苅！!!!';
  	t.reply_to << 't122';
    if t.save
      s = Tweet.find('4567');
  	  render json: s,status: :ok
    else
      render :template => 'welcome/index' , :layout => false , :status => 400
    end
  end
  def map
  	t = Map.new(id: '123456');
  	t.mapname = '六郷土手郵便局';
  	t.body = '大きい郵便局';
  	t.clean = '1';
  	t.famous = '2';
  	t.infoseek = '3';
  	t.comment << 'うれしい／たのしい／朝帰り';
    if t.save
      render :template => 'welcome/start' , :layout => false , :status => 200
    else
      render :template => 'welcome/index' , :layout => false , :status => 400
    end
  end
  def view
  	t = Tweet.find();
  	render json: t,status: :ok
  end
end

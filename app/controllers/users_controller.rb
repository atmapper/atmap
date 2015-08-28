class UsersController < ApplicationController
  skip_before_filter :authorize

  def index
    
    render json: '{}'
  end

  def create
    user = User.new()
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.startflg = "0"
    user.deleteflg = "0"
    user.auth = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(20).join
    user.auth += Time.now.strftime("%y%M%j%m%d").to_s
    logger.debug "before save"
    logger.debug user
    if user.save
        logger.debug "after save"
         PostMailer.post_email(user).deliver
        render json: '{}'
    else
        logger.debug user.errors.full_messages
        render json: '{}', status: 400
    end
  end
  def start
    if params[:id].blank?
      redirect_to root_path and return
    end

    user = User.find_by("auth = ? and startflg = 0", params[:id])
    if user.blank?
      flash.now[:notice] = "該当するユーザ情報が見つかりませんでした。すでに確認済みの可能性はありませんか？原因がわからない場合は、右上のメニューから問い合わせに進んでください。"
      render :template => "users/start" and return
    end

    logger.debug user
    user.startflg = 1
    if user.save
      flash.now[:notice] = "ユーザの確認が終わりました。ATMapを引き続きご利用おねがいします。"
      render :template => "users/start"
    else
      flash.now[:alert] = "確認中にエラーが発生しました。しばらく時間を置いた後、再度試してください。"
      render :template => "users/start"
    end
  end
end

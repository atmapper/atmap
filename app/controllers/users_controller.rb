class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]
  skip_before_filter :authorize

  def index
    render :template => 'users/index' , :layout => false
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)
    @user.startflg = "0"
    @user.deleteflg = "0"
    @user.auth = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(20).join
    @user.auth += Time.now.strftime("%M%j%y%m%d").to_s

    if @user.save
      #PostMailer.post_email(@user).deliver
      render :template => 'users/create'
    else
      render :template => 'users/index' , :layout => false , :status => 400
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end

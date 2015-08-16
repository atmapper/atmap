class PostMailer < ApplicationMailer
  default from: "send@atmap.top"
  def post_email(user)
  	logger.debug user
    @name = user.name
    @auth = user.auth
    mail to: user.email, subject: "ATMapに登録ありがとうございました。"
  end
end
